mockduo with self-signed cert

  $ cd ${TESTDIR}
  $ python mockduo.py certs/selfsigned.pem >/dev/null 2>&1 &
  $ trap 'kill %1' EXIT
  $ sleep 1

Wrong hostname
  $ ../login_duo/login_duo -d -c confs/selfsigned.conf -f whatever true
  [4] Failsafe Duo login for 'whatever': SSL: certificate subject name 'mockduo' does not match target host name 'localhost'

With noverify
  $ ../login_duo/login_duo -d -c confs/selfsigned_noverify.conf -f preauth-allow true
  [4] Skipped Duo login for 'preauth-allow': you rock