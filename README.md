<h1><b>HYNKY-DORYS</b></h1><br>
<i>by Vladimir V. KUCHINOV<br>
2015</i><br><br>

[a collection of useful classes for Processing 2.x / 3.x]<br><br>

<b>ArcSegment Class</b><br>
<i>good for Circular Relationship Diagram [radial convergences]</i><br><br>
syntaxes:<br>
1: heapA = new BinaryHeap(array);<br>
2: heapB = new BinaryHeap(arrayList);<br>


<b>Binary Heap</b><br>
<i>based on http://eloquentjavascript.net/1st_edition/appendix2.html, works both — with Array and ArrayList</i><br><br>
syntaxes:<br>
1: heapA = new BinaryHeap(array);<br>
2: heapB = new BinaryHeap(arrayList);<br>

Works as min-heap, could be easily transformed to max-heap.

<b>sortVectorsXYZ</b><br>
<i>based on java.util.Collections</i><br><br>
syntaxes:<br>
1: Collections.sort(ListName, new sortByX());<br>
2: Collections.sort(ListName, compose(new sortByX(), new sortByY()));<br>
	     
Could be easily extended by a third parameter, just add another children to<br>
'compose' superclass.<br><br>

