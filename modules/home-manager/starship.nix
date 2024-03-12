{ pkgs, lib, ... }:
{
    programs.starship = {
        enable = true;

        settings = {
            # Disable the blank line at the start of the prompt
            add_newline = false;

            format = lib.concatStrings [
                "[](#c4a7e7)"
                "$os"
                "$username"
                "[](bg:#eb6f92 fg:#c4a7e7)"
                "$directory"
                "[](fg:#eb6f92 bg:#ebbcba)"
                "$git_branch"
                "$git_status"
                "[](fg:#ebbcba bg:#f6c177)"
                "$c"
                "$elixir"
                "$elm"
                "$golang"
                "$gradle"
                "$haskell"
                "$java"
                "$julia"
                "$nodejs"
                "$nim"
                "$rust"
                "$scala"
                "[](fg:#f6c177 bg:#9ccfd8)"
                "$docker_context"
                "[](fg:#9ccfd8 bg:#31748f)"
                "$time"
                "[ ](fg:#31748f)"
            ];

            # You can also replace your username with a neat symbol like   or disable this
            # and use the os module below
            username = {
                show_always = true;
                style_user = "bg:#c4a7e7 fg:#191724";
                style_root = "bg:#c4a7e7 fg:#191724";
                format = "[$user ]($style)";
                disabled = false;
            };

            # An alternative to the username module which displays a symbol that
            # represents the current operating system
            os = {
                style = "bg:#c4a7e7 fg:#191724";
                disabled = true; # Disabled by default
            };
            

            directory = {
                style = "bg:#eb6f92 fg:#191724";
                format = "[ $path ]($style)";
                truncation_length = 3;
                truncation_symbol = "…/";
            };

            # Here is how you can shorten some long paths by text replacement
            # similar to mapped_locations in Oh My Posh:
            directory.substitutions = {
                "Documents" = "󰈙 ";
                "Downloads" = " ";
                "Music" = " ";
                "Pictures" = " ";
                # Keep in mind that the order matters. For example:
                # "Important Documents" = " 󰈙 ";
                # will not be replaced, because "Documents" was already substituted before.
                # So either put "Important Documents" before "Documents" or use the substituted version:
                # "Important 󰈙 " = " 󰈙 ";
            };
            

            c = {
                symbol = " ";
                style = "bg:#f6c177 fg:#191724";
                format = "[ $symbol ($version) ]($style)";
            };
            

            docker_context = {
                symbol = " ";
                style = "bg:#9ccfd8 fg:#191724";
                format = "[ $symbol $context ]($style)";
            };
            

            elixir = {
                symbol = " ";
                style = "bg:#f6c177 fg:#191724";
                format = "[ $symbol ($version) ]($style)";
            };
            

            elm = {
                symbol = " ";
                style = "bg:#f6c177 fg:#191724";
                format = "[ $symbol ($version) ]($style)";
            };
            

            git_branch = {
                symbol = "";
                style = "bg:#ebbcba fg:#191724";
                format = "[ $symbol $branch ]($style)";
            };
            

            git_status = {
                style = "bg:#ebbcba fg:#191724";
                format = "[$all_status$ahead_behind ]($style)";
            };
            

            golang = {
                symbol = " ";
                style = "bg:#f6c177 fg:#191724";
                format = "[ $symbol ($version) ]($style)";
            };
            

            gradle = {
                style = "bg:#f6c177 fg:#191724";
                format = "[ $symbol ($version) ]($style)";
            };
            

            haskell = {
                symbol = " ";
                style = "bg:#f6c177 fg:#191724";
                format = "[ $symbol ($version) ]($style)";
            };
            

            java = {
                symbol = " ";
                style = "bg:#f6c177 fg:#191724";
                format = "[ $symbol ($version) ]($style)";
            };
            

            julia = {
                symbol = " ";
                style = "bg:#f6c177 fg:#191724";
                format = "[ $symbol ($version) ]($style)";
            };
            

            nodejs = {
                symbol = "";
                style = "bg:#f6c177 fg:#191724";
                format = "[ $symbol ($version) ]($style)";
            };
            

            nim = {
                symbol = "󰆥 ";
                style = "bg:#f6c177 fg:#191724";
                format = "[ $symbol ($version) ]($style)";
            };
            

            rust = {
                symbol = "";
                style = "bg:#f6c177 fg:#191724";
                format = "[ $symbol ($version) ]($style)";
            };
            

            scala = {
                symbol = " ";
                style = "bg:#f6c177 fg:#191724";
                format = "[ $symbol ($version) ]($style)";
            };
            

            time = {
                disabled = false;
                ##time_format = "%R"; # Hour:Minute Format
                style = "bg:#31748f fg:#191724";
                format = "[ ♥ $time ]($style)";
                use_12hr = true;
            };
        };
    };
}