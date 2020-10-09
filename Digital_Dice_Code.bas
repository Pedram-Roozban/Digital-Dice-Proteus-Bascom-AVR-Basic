
REM Digital Dice with ATMEGA 16 and two 7-Segments

'---------------- Configuration  --------

REM Configuring Atmega 16 and it's ports
$regfile="m16def.dat"
$crystal=8000000
config portC = output
config portd = output
config pinb.0 = input


REM Configuring LCD
Config Lcd = 16 * 2
Config Lcdpin = Pin , Db7 = Pina.0 , Db6 = Pina.1 , Db5 = Pina.2 , Db4 = Pina.3 ,E = Pina.4, Rs = Pina.5


REM Configuring 7-segments
a alias portc.0
b alias portc.1
c alias portc.2
d alias portc.3
e alias portc.4
f alias portc.5
g alias portc.6

0a alias portD.0
0b alias portD.1
0c alias portd.2
0d alias portd.3
0e alias portd.4
0f alias portd.5
0g alias portd.6


REM Declaring two varibles
Dim x as byte
Dim y as byte

x = 0
y = 0

'--------------------- LCD Message and usage guidance ------------
Display on
Cursor off

LCD"Hello!"
wait 1
cls
waitms 400

locate 1,1
LCD"Push the button"

locate 2,1
LCD"to roll or stop."


'-------------------- DICES -----------------

REM The RND() function returns an Integer in given range.
REM Each new call to Rnd() will give a new positive random number.
REM WE use a key for allowing or stopping the dices from rolling.

 Do

     If pinb.0 = 1 then

            x = RND(7)
            select case x
            case 1 : gosub 01
            case 2 : gosub 02
            case 3 : gosub 03
            case 4 : gosub 04
            case 5 : gosub 05
            case 6 : gosub 06
            end select


            y = RND(7)
            select case y
            case 1 : gosub 11
            case 2 : gosub 22
            case 3 : gosub 33
            case 4 : gosub 44
            case 5 : gosub 55
            case 6 : gosub 66
            end select
            waitms 30

    end if

 Loop
end


'------------------- DICE 1 - 7SEGMENT  ------------

              01:
              set b
              set c
              reset a
              reset d
              reset e
              reset f
              reset g
              return

              02:
              set a
              set b
              set g
              set e
              set d
              reset c
              reset f
              return

              03:
              set a
              set b
              set g
              set c
              set d
              reset e
              reset f
              return

              04:
              set b
              set c
              set g
              set f
              reset a
              reset d
              reset e
              return

              05:
              set a
              set f
              set g
              set c
              set d
              reset b
              reset e
              return

              06:
              set a
              set f
              set g
              set c
              set d
              set e
              reset b
              return

'------------------ DICE 2 - 7SEGMENT ------------------

               11:
               set 0b
               set 0c
               reset 0a
               reset 0d
               reset 0e
               reset 0f
               reset 0g
               return

               22:
               set 0a
               set 0b
               set 0g
               set 0e
               set 0d
               reset 0c
               reset 0f
               return

               33:
               set 0a
               set 0b
               set 0g
               set 0c
               set 0d
               reset 0e
               reset 0f
               return

               44:
               set 0b
               set 0c
               set 0g
               set 0f
               reset 0a
               reset 0d
               reset 0e
               return

               55:
               set 0a
               set 0f
               set 0g
               set 0c
               set 0d
               reset 0b
               reset 0e
               return

               66:
               set 0a
               set 0f
               set 0g
               set 0c
               set 0d
               set 0e
               reset 0b
               return

