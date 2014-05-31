# royer_eeg_2010
 * virtual helicopter control
 * successful BCI - similar to keyboard control
 * subject specific signals
 * subjects train in one dimension, then two, then three
 * 8 to 11 sessions of 45 minutes to master left and right
 * total session length was 2 hours: hair washing & stuff
 * controlled for EOG
 * 64 channel EEG cap
 * control at approx 50Hz (20-50ms via UDP)
 * the "3D" movement was really fixed in 1 dimension
    ("0.5 Blender units per second")
 * their "cone of guidance" sounds like a obscure way to
   note that 1/2 the time subjects did not have good control;
 * seems like "cone of guidance" creates an illusion of control because
   it was hidden from subjects, seems to have helped to reduce frustration
 * idea for mouse: slow down over buttons, similar to increasing their size
   or a "gravity well"
 * sessions were 7-13 five-minute runs

# moyes_bci_2012
 * pong with EEG
 * one dimension of control
 * tried alpha and mu for control
 * seems they used general level of range (8-13Hz),
   not tightly focused on a specific frequency inside range
 * tried using SVM to detect p300; not successful
 * firmware and software on webpage
 * 75 USD budget
 * article states "There exists a Modular EEG serial packet data format
   that is typically used to transmit EEG data over serial"
 * references medical guidelines:
   ftp://ansuk.org/pub/clinical_governance/dig_eeg.pdf
