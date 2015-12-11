HONKY DORYS
by Vladimir V. KUCHINOV

[a collection of useful classes for Processing 2.x / 3.x]

sortVectorsXYZ:

based on java.util.Collections
syntax:  1: Collections.sort(ListName, new sortByX()); 
	     2: Collections.sort(ListName, compose(new sortByX(), new sortByY())); 
	     
Could be easily extended by a third parameter, just add another children to
'compose' superclass.
