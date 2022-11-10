/*
 * Copyright (c) Cangjie Library Team 2022-2022. All rights reserved.
 * Description:
 */

/**
 * @file
 * The file declars the LinkedHashMap class.
 */

package libphonenumber.inter

from std import collection.*
from std import sync.*

/**
 * The class is LinkedHashMap<K, V> inherited from Map<K, V> where K <: Hashable & Equatable<K>
 * @author Shawnzhao19
 * @since 0.34.3
 */
public class LinkedHashMap<K, V> <: Map<K, V> where K <: Hashable & Equatable<K> {
    private let map: HashMap<K, V>
    private let list: LinkedList<K>
    private let lock = ReentrantMutex()

    /**
     * The Function is init constructor
     *
     * @since 0.34.3
     */
    public init(){
        synchronized(lock){
            this.map=HashMap<K, V>()
            this.list=LinkedList<K>()
        }
    }

    /**
     * The Function is get
     *
     * @param key of K
     *
     * @return Type of Option<V>
     * @since 0.34.3
     */
    public func get(key: K): Option<V> {
        return this.map.get(key)
    }

    /**
     * The Function is get
     *
     * @param index of Int64
     *
     * @return Type of Option<(K,V)>
     * @since 0.34.3
     */
    public func getI(index: Int64): Option<(K,V)> {
        let key: K = this.list.get(index)
        return (key, this.map[key])
    }

    /**
     * The Function is contains
     *
     * @param key of K
     *
     * @return Type of Bool
     * @since 0.34.3
     */
    public func contains(key: K): Bool {
        return this.map.contains(key)
    }

    /**
     * The Function is containsAll
     *
     * @param keys of Collection<K>
     *
     * @return Type of Bool
     * @since 0.34.3
     */
    public func containsAll(keys: Collection<K>): Bool {
        return this.map.containsAll(keys)
    }

    /**
     * The Function is put
     *
     * @param key of K
     * @param value of V
     *
     * @return Type of Option<V>
     * @since 0.34.3
     */
    public func put(key: K, value: V): Option<V> {
        lock.lock()
        try {
            let result = this.map.put(key, value)
            match (result) {
                case Some(v) => ()
                case None => this.list.append(key)
            }
            return result
        } finally {
            lock.unlock()
        }
    }

    /**
     * The Function is putAll
     *
     * @param elements of Collection<(K,V)>
     *
     * @return Type of Unit
     * @since 0.34.3
     */
    public func putAll(elements: Collection<(K,V)>): Unit {
        lock.lock()
        try {
            for ((k,v) in elements) {
                this.put(k, v)
            }
        } finally {
            lock.unlock()
        }
    }

    /**
     * The Function is remove
     *
     * @param key of K
     *
     * @return Type of Option<V>
     * @since 0.34.3
     */
    public func remove(key: K): Option<V> {
        lock.lock()
        try {
            let result = this.map.remove(key)
            return match (result) {
                case Some(v) =>
                    var index = 0
                    for (k in this.list) {
                        if (key == k) {
                            break
                        }
                        index++
                    }
                    let rem = this.list.remove(index)
                    return v
                case None => None
            }
        } finally {
            lock.unlock()
        }
    }

    /**
     * The Function is removeAll
     *
     * @param keys of Collection<K>
     *
     * @return Type of Unit
     * @since 0.34.3
     */
    public func removeAll(keys: Collection<K>): Unit {
        for (key in keys) {
            this.remove(key)
        }
    }

    /**
     * The Function is removeIf
     *
     * @param predicate of (K,V)->Bool
     *
     * @return Type of Unit
     * @since 0.34.3
     */
    public func removeIf(predicate: (K, V) -> Bool): Unit {
        throw Exception("This operation is not supported")
    }

    /**
     * The Function is clear
     *
     *
     * @return Type of Unit
     * @since 0.34.3
     */
    public func clear(): Unit {
        lock.lock()
        try {
            this.map.clear()
            this.list.clear()
        } finally {
            lock.unlock()
        }
    }

    /**
     * The Function is clone
     *
     * @return Type of Map<K, V>
     * @since 0.34.3
     */
    public func clone(): Map<K, V> {
        return this.map.clone()
    }

    /**
     * The Function is []
     *
     * @param key of K
     *
     * @return Type of V
     * @since 0.34.3
     */
    public operator func [](key: K): V {
        return this.map[key]
    }

    /**
     * The Function is []
     *
     * @param key of K
     * @param value of V
     *
     * @return Type of Unit
     * @since 0.34.3
     */
    public operator func [](key: K, value!: V): Unit {
        this.put(key, value)
        return
    }

    /**
     * The Function is keys
     *
     *
     * @return Type of Keys<K>
     * @since 0.34.3
     */
    public func keys(): Keys<K> {
        return this.map.keys()
    }

    /**
     * The Function is values
     *
     * @return Type of Values<V>
     * @since 0.34.3
     */
    public func values(): Values<V> {
        return this.map.values()
        }
    /**
     * The Function is size
     *
     * @return Type of Int64
     * @since 0.34.3
     */
    public prop let size: Int64 {
        get() {
            if (this.list.size != this.map.size) {
                throw Exception("Internal error, inconsistent set size.")
            }
            return this.list.size
        }
    }

    /**
     * The Function is isEmpty
     *
     * @return Type of Bool
     * @since 0.34.3
     */
    public func isEmpty(): Bool {
        return this.size == 0
    }

    public func iterator(): Iterator<(K,V)> {
        return LinkedHashMapIterator<K, V>(this.list.iterator(), this.map)
    }
}

/**
 * The class is LinkedHashMapIterator<K, V> inherited from Iterator<(K,V)> where K <: Hashable & Equatable<K>
 * @author Thanksyjj
 * @since 0.34.3
 */
public class LinkedHashMapIterator<K, V> <: Iterator<(K,V)> where K <: Hashable & Equatable<K> {
    let it: Iterator<K>
    let map: HashMap<K, V>
    /**
     * The Function is init constructor
     *
     * @param list of Iterator<K>
     * @param map of HashMap<K,V>
     *
     * @since 0.34.3
     */
    init(list: Iterator<K>, map: HashMap<K, V>) {
        this.it = list
        this.map = map
    }

    /**
     * The Function is next
     *
     * @return Option<(K,V)>
     *
     * @since 0.34.3
     */
    public func next(): Option<(K,V)> {
        match (it.next()) {
            case Some(v) =>
                return (v, this.map[v])
            case _ => None
        }
    }

    /**
     * The Function is iterator
     *
     * @return Iterator<(K,V)>
     *
     * @since 0.34.3
     */
    public func iterator(): Iterator<(K,V)> {
        this
    }
}

/*
 * The class is Node<T>
 * @author @chinesebear
 * @since 0.34.3
 */
public class Node<T> {
    Node(var prev!: ?Node<T>, var value!: T, var next!: ?Node<T>) {}
}

/**
 * This class LinkList is link list data structure
 * @author @chinesebear
 * @since 0.34.3
 */
public class LinkedList<T> <: Collection<T> {
    private var mySize: Int64 = 0
    private var first: ?Node<T> = None
    private var last: ?Node<T> = None

    /**
     * The Function is init constructor
     *
     * @since 0.34.3
     */
    public init() {}

    /**
     * LinkedList size
     *
     * @return Int64 Return size value
     * @since 0.34.3
     */
    public prop let size: Int64 {
        get () {
            return mySize
        }
    }

    /**
     * The Function is clear
     *
     * @return Type of Unit
     */
    public func clear(): Unit {
        mySize = 0
        first = None
        last = None
    }

    /**
     * Judge LinkedList whether it is empty
     *
     * @return Bool The return type of Bool
     * @since 0.34.3
     */
    public func isEmpty(): Bool {
        mySize == 0
    }

    /**
     * LinkedList iterator
     *
     * @return Iterator The return type of Iterator<T>
     * @since 0.34.3
     */
    public func iterator(): Iterator<T> {
        LinkedListIterator(first)
    }

    /**
     * Get LinkedList first value.
     *
     * @return T The return type of T
     * @since 0.34.3
     */
    public func getFirst(): T {
        match (first) {
            case Some(v) => v.value
            case _ => throw IndexOutOfBoundsException()
        }
    }

    /**
     * Get LinkedList last value.
     *
     * @return T The return type of T
     * @since 0.34.3
     */
    public func getLast(): T {
        match (last) {
            case Some(v) => v.value
            case _ => throw IndexOutOfBoundsException()
        }
    }

    /**
     * Gets the value of the specified index
     *
     * @param index LinkedList index
     *
     * @return T Return value
     * @since 0.34.3
     */
    public func get(index: Int64): T {
        if (index < 0 || index >= mySize) {
            throw IndexOutOfBoundsException()
        }
        match (at(index)) {
            case Some(v) => v.value
            case _ => throw IndexOutOfBoundsException()
        }
    }

    /**
     * Replace element at specified location
     *
     * @param index Specified location index
     * @param element Specified location value
     *
     * @return T The return type of T
     * @since 0.34.3
     */
    public func set(index: Int64, element: T): T {
        if (index < 0 || index >= mySize) {
            throw IndexOutOfBoundsException()
        }
        match (at(index)) {
            case Some(v) =>
                let oldValue = v.value
                v.value = element
                oldValue
            case _ => throw IndexOutOfBoundsException()
        }
    }

    /**
     * Append element before
     *
     * @param element Append element
     *
     * @since 0.34.3
     */
    public func prepend(element: T): Unit {
        linkFirst(element)
    }

    /**
     * Append element after
     *
     * @param element Append element
     *
     * @since 0.34.3
     */
    public func append(element: T): Unit {
        linkLast(element)
    }

    /**
     * Inserts an element at the specified location
     *
     * @param index Specified location index
     * @param element Insert element
     *
     * @since 0.34.3
     */
    public func insert(index: Int64, element: T): Unit {
        if (index < 0 || index > mySize) {
            throw IndexOutOfBoundsException()
        }
        if (index == 0) {
            linkFirst(element)
        } else if (index == mySize - 1) {
            linkLast(element)
        } else {
            linkBefore(element, at(index))
        }
    }

    /**
     * Removes the element at the specified location
     *
     * @param index Specified location index
     *
     * @return T The return type of T
     * @since 0.34.3
     */
    public func remove(index: Int64): T {
        if (index < 0 || index >= mySize) {
            throw IndexOutOfBoundsException()
        }
        match (at(index)) {
            case Some(v) => unlink(v)
            case _ => throw IndexOutOfBoundsException()
        }
    }

    /**
     * Remove first element
     *
     * @return The return type of T
     * @since 0.34.3
     */
    public func removeFirst(): T {
        match (first) {
            case Some(v) => unlinkFirst(v)
            case _ => throw IndexOutOfBoundsException()
        }
    }

    /**
     * Remove last element
     *
     * @return The return type of T
     * @since 0.34.3
     */
    public func removeLast(): T {
        match (last) {
            case Some(v) => unlinkLast(v)
            case _ => throw IndexOutOfBoundsException()
        }
    }

    /*
     * The Function is at
     *
     * @param index of Int64
     *
     * @return Type of ?Node<T>
     * @since 0.34.3
     */
    private func at(index: Int64): ?Node<T> {
        if (index < (mySize >> 1)) {
            var x = first
            for (i in 0..index) {
                match (x) {
                    case Some(v) => x = v.next
                    case _ => ()
                }
            }
            x
        } else {
            var x = last
            var i = mySize - 1
            while (i > index) {
                match (x) {
                    case Some(v) => x = v.prev
                    case _ => ()
                }
                i--
            }
            x
        }
    }

    /*
     * The Function is linkFirst
     *
     * @param element of T
     *
     * @return Type of Unit
     * @since 0.34.3
     */
    private func linkFirst(element: T): Unit {
        let first = this.first
        let newNode = Node(prev: None<Node<T>>, value: element, next: first)
        this.first = newNode
        match (first) {
            case Some(v) => v.prev = newNode
            case _ => last = newNode
        }
            mySize++
    }

    /*
     * The Function is linkLast
     *
     * @param element of T
     *
     * @return Type of Unit
     * @since 0.34.3
     */
    private func linkLast(element: T): Unit {
        let last = this.last
        let newNode = Node(prev: last, value: element, next: None<Node<T>>)
        this.last = newNode
        match (last) {
            case Some(v) => v.next = newNode
            case _ => first = newNode
        }
        mySize++
    }

    /*
     * The Function is linkBefore
     *
     * @param element of T
     * @param succ of ?Node<T>
     *
     * @return Type of Unit
     * @since 0.34.3
     */
    private func linkBefore(element: T, succ: ?Node<T>): Unit {
        match (succ) {
            case Some(v) =>
                let pred = v.prev
                let newNode = Node(prev: pred, value: element, next: succ)
                v.prev = newNode
                match (pred) {
                    case Some(v2) => v2.next = newNode
                    case _ => first = newNode
                }
                mySize++
            case _ => ()
        }
    }

    /*
     * The Function is unlinkFirst
     *
     * @param x of Node<T>
     *
     * @return Type of T
     * @since 0.34.3
     */
    private func unlinkFirst(x: Node<T>): T {
        let element = x.value
        let next = x.next
        x.next = None
        this.first = next
        match (next) {
            case Some(v) => v.prev = None
            case _ => last = None
        }
        mySize--
        element
    }

    /*
     * The Function is unlinkLast
     *
     * @param x of Node<T>
     *
     * @return Type of T
     * @since 0.34.3
     */
    private func unlinkLast(x: Node<T>): T {
        let element = x.value
        let prev = x.prev
        x.prev = None
        this.last = prev
        match (prev) {
            case Some(v) => v.next = None
            case _ => first = None
        }
        mySize--
        element
    }

    /*
     * The Function is unlink
     *
     * @param x of Node<T>
     *
     * @return Type of T
     * @since 0.34.3
     */
    private func unlink(x: Node<T>): T {
        let element = x.value
        let next = x.next
        let prev = x.prev
        match (prev) {
            case Some(v) =>
                v.next = next
                x.prev = None
            case _ =>
                first = next
        }
        match (next) {
            case Some(v) =>
                v.prev = prev
                x.next = None
            case _ =>
                last = prev
        }
        mySize--
        element
    }
}

/**
 * The class is LinkedList Iterator
 * @author @chinesebear
 * @since 0.34.3
 */
public class LinkedListIterator<T> <: Iterator<T> {
    LinkedListIterator(var current: ?Node<T>) {}

    /**
     * The Function is next
     *
     * @return Type of ?T
     * @since 0.34.3
     */
    public func next(): ?T {
        match (current) {
            case Some(v) =>
                let element = v.value
                current = v.next
                element
            case _ => None
        }
    }

    /**
     * The Function is iterator
     *
     * @return Type of Iterator<T>
     * @since 0.34.3
     */
    public func iterator(): Iterator<T> {
        this
    }
}
