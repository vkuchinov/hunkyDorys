<b>HONKY DORYS</b><br>
<i>by Vladimir V. KUCHINOV</i><br><br>

[a collection of useful classes for Processing 2.x / 3.x]<br><br>

sortVectorsXYZ:<br>

based on java.util.Collections<br>
syntax:  1: Collections.sort(ListName, new sortByX());<br>
	     2: Collections.sort(ListName, compose(new sortByX(), new sortByY()));<br><br>
	     
Could be easily extended by a third parameter, just add another children to<br>
'compose' superclass.<br>
