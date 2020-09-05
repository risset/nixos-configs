Config {
      font = "xft:FiraCode Nerd Font:size=11:Source Han Sans:size=11"
    , borderColor = "#1d1e1f"
    , border = TopB
    , alpha = 230
    , bgColor = "#272822"
    , fgColor = "#dddddd"
    , position = TopW L 100
    , commands = [
	Run MPD ["-t", "<state>: <artist> - <title>"] 20,

	Run Memory [
	    "-t",
	    "<usedratio>%"
	] 10,

	Run Cpu [
	    "-t",
	    "<total>%",
	    "-L",
	    "3",
	    "-H",
	    "50",
	    "--normal",
	    "#a6e22e",
	    "--high",
	    "red"
	] 10,

	Run Date "%H:%M:%S" "date" 10,

	Run StdinReader
    ]

    , sepChar = "%"
    , alignSep = "}{"
    , template = "%StdinReader% }{<fc=#ae81ff>  </fc>%mpd%    <fc=#ae81ff>  </fc>%memory%    <fc=#ae81ff>  </fc>%cpu%    <fc=#ae81ff>  </fc>%date% "
}
