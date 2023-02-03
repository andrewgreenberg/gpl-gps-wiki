# IMPORTANT! THIS PROJECT IS DEPRECATED!

This project has not been touched since 2005. It's been replaced by a series of MAX2771 projects we've done since. Several people have requested I post this information since the old wiki is down, so here it is for posterity. Note that I probably can't help you at this point if you have questions, so good luck, and let me know how it goes!

-----

# Welcome to the home of the GPL-GPS Project

This site is the home for the **GPL-GPS** ("General Public License"-GPS) project, an effort to bring free and open source software to inexpensive, commercially-available OEM (Original Equipment Manufacturer) GPS receiver boards. The GPL-GPS software is based on on [Clifford Kelley's OpenSource GPS software](http://home.earthlink.net/~cwkelley/). There are many different open source and open hardware GNSS projects; you can find a list of them [[here|OpenGnssProjects]].

Note that GPL-GPS is _**not**_ mapping software or any kind of communication toolkit for talking with commercial receivers; rather, it is _**firmware that is meant to run on the receiver board itself**_, giving you direct access to the GPS chipset.

[[News 2006/09/30|GpsNews]]: GPL-GPS clas taught at ION GNSS 2006, GPL-GPS merging back with OSGPS is possible, GPL-GPS instructions being updated.

## What You'll Need

To develop software with GPL-GPS, you'll need the following:

- A GPS receiver board based on the [Zarlink](http://www.zarlink.com) GP4020 GPS receiver baseband processor with &gt;= 256 KB flash and &gt;= 256 KB of RAM.
- A carrier board to convert the 5V serial ports from the GP4020 to RS-232c levels, as well as provide a reset switch, LEDs, and other debugging niceties.
- A Linux-based development PC with a serial port (it's probably possible to do this with Cygwin, or even a Mac, but I can't help you as to how).
- Any old PC with a serial port and serial console (or conversely, a second serial port on the Linux development PC).
- The GNU cross-development environment for ARM processors.
- The eCos real time operating system development environment.
- The GPL-GPS software, checked out with cvs.

It's a long process, but when you're done you'll have a completely open source GPS receiver development system!

## The Motivation

The motivation for GPL-GPS is the desire for advanced features in an inexpensive receiver. Currently, all OEM GPS receivers - i.e., the single GPS receiver boards with no case, display, etc - have closed-source, proprietary firmware which makes certain assumptions on the system dynamics or application which may not be appropriate. By using open source firmware on these boards, the end user may optimize their receiver's firmware for their application. Applications include:

- Inertial aiding of the correlator loops for UAVs and other high-dynamic environments
- Differential message generation
- Possibly precision timing applications
- An inexpensive GPS teaching and/or algorithm prototyping tool for academia

## Current Status (2006/09/06)

GPL-GPS is currently up and running using the eCos real time operating system and very modified version of Tak's port of OpenSourceGPS. It's currently positioning, with errors down in the 100's of meters. This is fine, considering there's _nothing_ fancy in the positioning code, not even ionospheric/tropospheric corrections or averaging. Next on the agenda: optimizations, features, and more fancy things. And work on the tracking loops, which drop satellites like hot potatoes.

- Current [[To Do list|ToDo]]
- [[List of GPL-GPS developers|WhosWho]]!
- [[Projects using GPL-GPS|CurrentProjects]]
