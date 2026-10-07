{
  config,
  pkgs,
  lib,
  inputs,
  user,
  username,
  ...
}:

{
  networking.extraHosts = ''
    127.0.0.1	nextcloud.test
    ::1	nextcloud.test
    127.0.0.1	nextcloud2.test
    ::1	nextcloud2.test
    127.0.0.1	nextcloud3.test
    ::1	nextcloud3.test
    127.0.0.1	stable16.test
    ::1	stable16.test
    127.0.0.1	stable17.test
    ::1	stable17.test
    127.0.0.1	stable18.test
    ::1	stable18.test
    127.0.0.1	stable19.test
    ::1	stable19.test
    127.0.0.1	stable20.test
    ::1	stable20.test
    127.0.0.1	stable21.test
    ::1	stable21.test
    127.0.0.1	stable22.test
    ::1	stable22.test
    127.0.0.1	stable23.test
    ::1	stable23.test
    127.0.0.1	stable24.test
    ::1	stable24.test
    127.0.0.1	stable25.test
    ::1	stable25.test
    127.0.0.1	stable26.test
    ::1	stable26.test
    127.0.0.1	stable27.test
    ::1	stable27.test
    127.0.0.1	stable28.test
    ::1	stable28.test
    127.0.0.1	stable29.test
    ::1	stable29.test
    127.0.0.1	stable30.test
    ::1	stable30.test
    127.0.0.1	stable31.test
    ::1	stable31.test
    127.0.0.1	stable32.test
    ::1	stable32.test
    127.0.0.1	stable33.test
    ::1	stable33.test
    127.0.0.1	stable34.test
    ::1	stable34.test
    127.0.0.1	stable35.test
    ::1	stable35.test
    127.0.0.1	mail.test
    ::1	mail.test
    127.0.0.1	sso.test
    ::1	sso.test
    127.0.0.1	minio.test
    ::1	minio.test
    127.0.0.1	rustfs.test
    ::1	rustfs.test
    127.0.0.1	imap.test
    ::1	imap.test
    127.0.0.1	collabora.test
    ::1	collabora.test
    127.0.0.1	codedev.test
    ::1	codedev.test
    127.0.0.1	onlyoffice.test
    ::1	onlyoffice.test
    127.0.0.1	proxy.test
    ::1	proxy.test
    127.0.0.1	hpb.test
    ::1	hpb.test
    127.0.0.1	push.test
    ::1	push.test
    127.0.0.1	keycloak.test
    ::1	keycloak.test
    127.0.0.1	portal.test
    ::1	portal.test
    127.0.0.1	gs1.test
    ::1	gs1.test
    127.0.0.1	gs2.test
    ::1	gs2.test
    127.0.0.1	gs3.test
    ::1	gs3.test
    127.0.0.1	lookup.test
    ::1	lookup.test
    127.0.0.1	elasticsearch.test
    ::1	elasticsearch.test
    127.0.0.1	elasticsearch-ui.test
    ::1	elasticsearch-ui.test
    127.0.0.1	pgadmin.test
    ::1	pgadmin.test
    127.0.0.1	phpmyadmin.test
    ::1	phpmyadmin.test
    127.0.0.1	talk-signaling.test
    ::1	talk-signaling.test
    127.0.0.1	talk-recording.test
    ::1	talk-recording.test
    127.0.0.1	authentik.test
    ::1	authentik.test
    127.0.0.1 kylobytes.test
    :: kylobytes.test
    127.0.0.1 leftybournes.test
    :: leftybournes.test
  '';
}
