Config {
      font = "xft:FiraCode Nerd Font:size=11"
    , borderColor = "#1d1e1f"
    , border = TopB
    , alpha = 230
    , bgColor = "#272822"
    , fgColor = "#dddddd"
    , position = TopW L 100
    , commands = [
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
    , template = "%StdinReader% }{<fc=#a6e22e>  </fc>%memory%    <fc=#66d9ef>  </fc>%cpu%    <fc=#ae81ff>  </fc>%date% "
}
