/*
  Listen for MIDI messages (on soft serial pin) and write
  diagnostics (on hard serial)

  CC0 Rich Holmes Feb 2020
*/

#define DO_PRINT 0  // Print events (requires software serial)
#define HSERIAL 1  // 1 for hardware serial, 0 for software
#define OLED 1 // 1 if using OLED display

#define TELL_NOTEON     1
#define TELL_NOTEOFF    1
#define TELL_PITCHBEND  1
#define TELL_CC         1
#define TELL_CLOCK   0 // Every nth clock
#define TELL_OTHER      1
#define TELL_ACTIVE     0 // Every nth active sense

#define LED_TELL 10

#if OLED>0
#include <U8g2lib.h>

U8X8_SSD1306_128X64_NONAME_HW_I2C u8x8;

// Create a U8x8log object
U8X8LOG u8x8log;

// Define the dimension of the U8x8log window
#define U8LOG_WIDTH 16
#define U8LOG_HEIGHT 8

// Allocate static memory for the U8x8log window
uint8_t u8log_buffer[U8LOG_WIDTH*U8LOG_HEIGHT];
#endif

#include <MIDI.h>

#if HSERIAL==1
MIDI_CREATE_DEFAULT_INSTANCE();
#else
#define MIDI_RX 6 // <--- connect the optocoupler to this pin
#define MIDI_TX 7

#include <SoftwareSerial.h>
SoftwareSerial midiSerial(MIDI_RX, MIDI_TX);
MIDI_CREATE_INSTANCE(SoftwareSerial, midiSerial, MIDI);
#endif

unsigned long led_time = 0;

void setup()
{
#if HSERIAL==0
  Serial.begin(9600);
  Serial.println("setup begin");
#endif

#if OLED>0
  // Startup U8x8
  u8x8.begin();
  
  // Set a suitable font. This font will be used for U8x8log
  u8x8.setFont(u8x8_font_chroma48medium8_r);
  
  // Start U8x8log, connect to U8x8, set the dimension and assign the static memory
  u8x8log.begin(u8x8, U8LOG_WIDTH, U8LOG_HEIGHT, u8log_buffer);
  
  // Set the U8x8log redraw mode
  u8x8log.setRedrawMode(0);    // 0: Update screen with newline, 1: Update screen for every char  
#endif

  u8x8log.print("Startup\n");
  
  MIDI.begin(MIDI_CHANNEL_OMNI);

  pinMode(LED_TELL, OUTPUT);
  digitalWrite(LED_TELL, LOW);
  
  led_time = 0;
#if HSERIAL==0
  Serial.println("setup end");
#endif
}

void loop()
{
  int type, noteMsg, velocity, channel, d1, d2, led_on;
  static unsigned int clock_count = 0;
  static unsigned int active_count = 0;

  if (led_time > 0 && millis() - led_time > 300)
    {
      digitalWrite(LED_TELL, LOW);
      led_time = 0;
    }

  led_on = 0;
  if (MIDI.read()) {
    byte type = MIDI.getType();
    switch (type) {
    case midi::NoteOn:
#if TELL_NOTEON>0       
      led_on = 1;
      noteMsg = MIDI.getData1();
      channel = MIDI.getChannel();
      velocity = MIDI.getData2();
#if OLED>0
      u8x8log.print("NtOn ");
      u8x8log.print(channel);
      u8x8log.print(" ");
      u8x8log.print(noteMsg);
      u8x8log.print(" ");
      u8x8log.print(velocity);
      u8x8log.print("\n");
#endif
#if DO_PRINT > 0
      Serial.print ("NoteOn");
      Serial.print (" channel ");
      Serial.print (channel);  
      Serial.print (" MIDI note ");
      Serial.print (noteMsg);
      Serial.print (" velocity ");
      Serial.println (velocity);  
#endif
#endif
      break;

    case midi::NoteOff:
#if TELL_NOTEOFF>0      
      led_on = 1;
      noteMsg = MIDI.getData1();
      channel = MIDI.getChannel();
#if OLED>0
      u8x8log.print("NtOf ");
      u8x8log.print(channel);
      u8x8log.print(" ");
      u8x8log.print(noteMsg);
      u8x8log.print("\n");
#endif
#if DO_PRINT > 0
      Serial.print ("NoteOff");
      Serial.print (" channel ");
      Serial.println (channel);  
      Serial.print (" MIDI note ");
      Serial.print (noteMsg);
#endif
#endif
      break;

    case midi::PitchBend:
#if TELL_PITCHBEND>0
      led_on = 1;
      d1 = MIDI.getData1();
      d2 = MIDI.getData2(); // d2 from 0 to 127, mid point = 64
#if OLED>0
      u8x8log.print("PtBn ");
      u8x8log.print(d1);
      u8x8log.print(" ");
      u8x8log.print(d2);
      u8x8log.print("\n");
#endif
#if DO_PRINT > 0
      Serial.print ("PitchBend");
      Serial.print (" d1 ");
      Serial.print (d1);
      Serial.print (" d2 ");
      Serial.println (d2);  
#endif
#endif
      break;

    case midi::ControlChange:
#if TELL_CC     
      led_on = 1;
      d1 = MIDI.getData1();
      d2 = MIDI.getData2(); // From 0 to 127
#if OLED>0
      u8x8log.print("CC   ");
      u8x8log.print(d1);
      u8x8log.print(" ");
      u8x8log.print(d2);
      u8x8log.print("\n");
#endif
#if DO_PRINT > 0
      Serial.print ("ControlChange");
      Serial.print (" d1 ");
      Serial.print (d1);
      Serial.print (" d2 ");
      Serial.println (d2);  
#endif
#endif
      break;

    case midi::Clock:
#if TELL_CLOCK>0
      if (clock_count == 0)
	{
	  led_on = 1;
#if OLED>0
	  u8x8log.print("Clok ");
	  u8x8log.print("\n");
#endif
#if DO_PRINT > 0
	  Serial.println ("Clock tick");
#endif
	}
      clock_count++;
      if (clock_count == TELL_CLOCK)
        clock_count = 0;
#endif
      break;

    case midi::ActiveSensing:
#if TELL_ACTIVE>0
      if (active_count == 0)
        {          
          led_on = 1;
#if OLED>0
	  u8x8log.print("AcSn ");
	  u8x8log.print("\n");
#endif
#if DO_PRINT > 0
	  Serial.println ("ActiveSensing");
#endif
        }
      active_count++;
      if (active_count == TELL_CLOCK)
        active_count = 0;
#endif
      break;
      

    default:
#if TELL_OTHER>0        
      led_on = 1;
      d1 = MIDI.getData1();
      d2 = MIDI.getData2();
#if OLED>0
      u8x8log.print("Type ");
      u8x8log.print(type);
      u8x8log.print(" ");
      u8x8log.print(d1);
      u8x8log.print(" ");
      u8x8log.print(d2);
      u8x8log.print("\n");
#endif
#if DO_PRINT > 0
      Serial.print ("Type = ");
      Serial.print (type);
      Serial.print (" d1 ");
      Serial.print (d1);
      Serial.print (" d2 ");
      Serial.println (d2);  
#endif
#endif
      break;
    }
    if (led_on > 0)
      {    
	digitalWrite(LED_TELL, HIGH);
        led_time = millis();
      }
  }
}
