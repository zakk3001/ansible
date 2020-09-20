#!/bin/bash
PATH=/bin:/usr/bin:/usr/sbin

# Your Email Information: Recipient (To:), Subject and Body
RECIPIENT="lucbellemare3001@gmail.com"
SUBJECT="Email from your Server: SSH Alert"

BODY="
A SSH login was successful, so here are some information for security:
  	User:        $PAM_USER
	User IP Host: $PAM_RHOST
	Service:     $PAM_SERVICE
	TTY:         $PAM_TTY
	Date:        `date`
	Server:      `uname -a`
	Ip:          `ifconfig |grep "inet "|grep "broadcast"`
"

if [[ ${PAM_TYPE} = "open_session" ]]; then
    if [[ ${PAM_USER} != "ansible" ]]; then
	echo "Subject:${SUBJECT} ${BODY}" | /usr/sbin/sendmail ${RECIPIENT}
    else
        exit 0
    fi
fi

exit 0
