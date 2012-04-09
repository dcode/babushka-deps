#dep 'solarized dotfiles' do
#    requires 'dotfiles created'
#    on :linux do
#	met? { }
#	meet { 
#	    shell "cp ./solarized/Xresources ~/.dotfiles/.Xresources"
#	}
#    end
#end

dep 'solarize gnome-terminal profile' do
    on :linux do
	met? { 
	    shell('gconftool-2 --get "/apps/gnome-terminal/global/profile_list"')["Solarize"]
        }
	meet {
            shell('gconftool-2 --load ~/src/babushka-deps/solarize/gnome-terminal_solarize.xml')
            out = shell('gconftool-2 --get "/apps/gnome-terminal/global/profile_list" | sed "s/]$/,Solarize]/" ')
            shell("gconftool-2 -t li --list-type=string -s \"/apps/gnome-terminal/global/profile_list\" \"#{ out }\"")
	}
    end
end

dep 'solarize gnome-terminal default' do
    on :linux do
        requires 'solarize gnome-terminal profile'
        met? {
            shell('gconftool-2 --get "/apps/gnome-terminal/global/default_profile"')["Solarize"]
        }
        meet {
            shell('gconftool-2 -t str -s "/apps/gnome-terminal/global/default_profile" "Solarize"')
        }
    end
end

dep 'solarize linux console' do
    on :linux do
        met? { # Test for included lines in .bash_profile
        }
        meet { 
        # Use babushka's method for adding lines to text files
        # [TODO] Uses snippets in the 'solarize' dir

        }
    end
end

dep 'solarize' do
    on :linux do
        requires 'solarize gnome-terminal default'
    end
end
