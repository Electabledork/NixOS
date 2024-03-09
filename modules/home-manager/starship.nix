{ pkgs, ... }:
{
    programs.starship {
        enable = true;

        settings = {
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
        };
    }
}