# kiosksetup

These scripts *should* automatically pull all information needed to make a reliable kiosk.

### To start you will need the following:

User should be able to be anything, it defaults to pi
any password you choose will work.

---
`curl -o /home/pi/kiosksetup.sh https://raw.githubusercontent.com/tecstaffing-dev/kiosksetup/main/kiosksetup.sh`

`chmod +x /home/pi/kiosksetup.sh`

When executing the file kiosksetup.sh it requires you to add something to the end, for this example we're using fsind

`./kiosksetup.sh fsind`

valid switches are:

`fsind springdale fayetteville rogers russellville searcykiosk careersolutions clarksville conway vanburen`

They must be put in exactly like that, it **will** break things later if you don't.

---
Sit back, grab a cuppa and wait for it to reboot, if all goes correctly, it should automatically open to whatever kiosk you've selected.
