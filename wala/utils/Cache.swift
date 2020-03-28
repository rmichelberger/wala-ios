//
//  Cache.swift
//  wala
//
//  Created by Roland Michelberger on 28.03.20.
//  Copyright © 2020 makeitappen GmbH. All rights reserved.
//


import Foundation

protocol Cache {
    associatedtype Key where Key: Hashable
    associatedtype Value
    
    subscript(key: Key) -> Value? { get set}
    subscript(key: Key, default defaultValue: @autoclosure () -> Value) -> Value { get set}
}

struct DiskCache<Key, Value>: Cache  where Key : Hashable {
    
    private let cache = UserDefaults.standard
    
    subscript(key: Key) -> Value? {
        get {
            if let key = key as? String {
                return cache.object(forKey: key) as? Value
            } else {
                return nil
            }
        }
        set {
            if let key = key as? String {
                cache.set(newValue, forKey: key)
                cache.synchronize()
            }
        }
    }
    
    subscript(key: Key, default defaultValue: @autoclosure () -> Value) -> Value {
        get {
            self[key] ?? defaultValue()
        }
        set {
            self[key] = newValue
        }
    }
    
    
}

struct MemCache<Key, Value>: Cache  where Key : Hashable {
    
    private var cache = [Key:Value]()
    
    func get(key: Key) -> Value? {
        return cache[key]
    }
    
    mutating func set(value: Value, for key: Key){
        cache[key] = value
    }
    
    mutating func updateValue(_ value: Value, forKey key: Key) -> Value? {
        return cache.updateValue(value, forKey: key)
    }
    
    subscript(key: Key) -> Value? {
        get {
            cache[key]
        }
        set {
            cache[key] = newValue
        }
    }
    
    subscript(key: Key, default defaultValue: @autoclosure () -> Value) -> Value {
        get {
            self[key] ?? defaultValue()
        }
        set {
            self[key] = newValue
        }
    }
}
