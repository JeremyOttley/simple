export GDK_SCALE=2
export QT_AUTO_SCREEN_SCALE_FACTOR=1
export QT_SCALE_FACTOR=1.2
export MOZ_USE_XINPUT2=1
xrandr --auto
exec dbus-launch --exit-with-session i3
