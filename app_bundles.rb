dep 'Transmission.app' do
  source 'http://download.transmissionbt.com/files/Transmission-2.51.dmg'
end

dep 'transgui.installer' do
  source 'http://transmisson-remote-gui.googlecode.com/files/transgui-4.0.1.dmg'
  met? { "/Applications/Transmission\ Remote\ GUI.app".p.exists? }
end
