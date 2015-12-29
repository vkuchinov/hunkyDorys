<h1><b>HYNKY-DORYS</b></h1><br>
<i>by Vladimir V. KUCHINOV<br>
2015</i><br><br>

[a collection of useful classes for Processing 2.x / 3.x]<br><br>

<b>sortVectorsXYZ</b><br>
<i>based on java.util.Collections</i><br><br>
syntax:<br>
1: Collections.sort(ListName, new sortByX());<br>
2: Collections.sort(ListName, compose(new sortByX(), new sortByY()));<br>
	     
Could be easily extended by a third parameter, just add another children to<br>
'compose' superclass.<br><br>
