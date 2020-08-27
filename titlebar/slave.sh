	time=$(date '+%m/%d|%u %H:%M:%S');
	batper=$(sh ~/bin/get-battery-percentage.sh);
	frpm=$(sensors | grep -Po '(?<=fan1:).*$' | sed 's/[[:space:]]*//gm' | sed 's/RPM//');
	cput=$(sensors | grep -Po '(?<=temp1:).*$' | sed 's/[[:space:]]*//gmi' | sed 's/C//gi' | sed 's/\+//gi' | sed 's/\..*//gi');

	xsetroot -name "$frpm $cput [$batper]⊐ $time";
