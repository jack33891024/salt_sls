install-ntpdate:
  pkg.installed:
    - name: ntpdate

cron-update:
  cron.present:
    - name: /usr/sbin/ntpdate time.windows.com & >/dev/null
    - user: root
    - minute: '*/5'
