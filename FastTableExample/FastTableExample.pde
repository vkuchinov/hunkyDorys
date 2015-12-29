/*

javolution.util.FastTable
based on JAVA library [javolution-core-java-6.0.0.jar] take from
https://maven.java.net/content/repositories/snapshots/org/javolution/

A high-performance table (fractal-based) with real-time behavior.
The fractal-based implementation ensures that add/insertion/deletion 
operations worst execution time is always in less than O(log(size)). 
For comparison ArrayList.add is in O(size) due to resize.

some methods:
atomic(): Returns an atomic view over this collection. 
reverse(): Returns a view exposing elements in reverse iterative order.
subTable(): Returns a view over a portion of the table (equivalent to List.subList(int, int)).
size(): Returns the size of this collection.
clear(): Removes all elements from this collection.
add(): Inserts the specified element at the specified position in this table.
addAll(): Inserts all of the elements in the specified collection into this table at the specified position.
remove(): Removes the element at the specified position in this table.
get(): Returns the element at the specified position in this table.
set(): Replaces the element at the specified position in this table with the specified element.

indexOf(): Returns the index of the first occurrence of the specified element in this table, or -1 if this table does not contain the element.
lastIndexOf(): Returns the index of the last occurrence of the specified element in this table, or -1 if this table does not contain the element.

//also valid for Last
getFirst(): Retrieves, but does not remove, the first element of this table.
peekFirst(): Retrieves, but does not remove, the first element of this table, or returns null if this table is empty.
pollFirst(): Retrieves and removes the first element of this table, or returns null if this table is empty.
offerFirst(): Inserts the specified element at the front of this table.
removeFirstOccurrence(): Removes the first occurrence of the specified element from this table.

offer():Inserts the specified element into the queue represented by this table.
poll(): Retrieves and removes the head of the queue represented by this table.
sort(): Sorts this table in place (quick sort).

Implemented Interfaces:
Serializable, Iterable<E>, Collection<E>, Deque<E>, List<E>, Queue<E>, RandomAccess

Direct Known Subclasses:
FastSortedTable

REFERENCES:
http://javolution.org/apidocs/javolution/util/FastTable.html
http://javolution.org/apidocs/javolution/util/doc-files/FastTable-WCET.png

FURTHER RESEARCH:
http://javolution.org/ [Java library for real-Time, embedded and high-performance applications]
https://en.wikipedia.org/wiki/Javolution

What is Javalution?

High-Performance -  Hardware accelerated computing (GPUs) with ComputeContext.
Minimalistic - Collection classes, supporting custom views, closure-based iterations, 
map-reduce paradigm, parallel computations, etc.
Optimized - To reduce the worst case execution time documented through annotations.
Innovative - Fractal-based structures to maintain high-performance regardless of the size of the data.
Multi-Cores Ready - Most parallelizable classes (including collections) are either mutex-free (atomic) 
or using extremely short locking time (shared).
OSGi Compliant - Run as a bundle or as a standard library. OSGi contexts allow cross cutting concerns 
(concurrency, logging, security, ...) to be addressed at run-time through OSGi published services 
without polluting the application code (Separation of Concerns).
Interoperable - Struct and Union base classes for direct interfacing with native applications. 
Development of the Javolution C++ library to mirror its Java counterpart and makes it easy to port any 
Java application to C++ for native compilation (maven based) or to write Java-Like code directly in C++ 
(more at Javolution C++ Overview)).
Simple - You don't need to know the hundreds of new Java 8 util.* classes, most can be built from scratch 
by chaining Javolution collections or maps. No need to worry about configuration, immutability or 
code bloating !
Free - Permission to use, copy, modify, and distribute this software is freely granted, provided that 
copyright notices are preserved (BSD License).

@author Vladimir V. KUCHINOV
@email  helloworld@vkuchinov.co.uk

*/

import javolution.util.FastTable;

FastTable fast;

void setup(){
  
   //<data> define data type
   fast = new FastTable<PVector>();
   
   for(int v = 0; v < 256; v++){
    
     fast.add(new PVector(random(-100.0, 100.0), random(-100.0, 100.0)));
     
   }  
   
   println(fast.size());
  
}
