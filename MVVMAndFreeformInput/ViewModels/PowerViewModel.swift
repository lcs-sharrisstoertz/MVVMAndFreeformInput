//
//  PowerViewModel.swift
//  MVVMAndFreeformInput
//
//  Created by Skye Willow Harris-Stoertz on 2025-02-21.
//

import Foundation

@Observable
class PowerViewModel {
    
    // MARK: Stored properties
    
    // Holds whatever the user has typed in the text fields
    var providedBase: String
    var providedExponent: String
    
    // Holds an appropriate error message, if there was a
    // problem with input provided by the user
    var recoverySuggestion: String = ""
    
    
    // MARK: Computed properties
    // Holds the evaluated power, when the input provided is valid
    var power: Power? {
        
        // First check that the string in providedBase can
        // be converted into a number, then check that the
        // value is more than 0
        guard let base = Double(providedBase), base != 0 else {
            recoverySuggestion = "Please provide value other than zero for the base of the power."
            
            return nil
        }
        
        // Now check that the string in providedExponent can be
        // converted into an integer, and that the value is at least 0
        guard let exponent = Int(providedExponent) else {
            recoverySuggestion = "Please provide an integer value for the exponent."
            
            return nil
        }
        
        
        // Now that we know the base and exponent have valid values, return the evaluated power
        recoverySuggestion = "" // No error message
        return Power(base: base, exponent: exponent)
        
    }
    
    
    // MARK: Initializer(s)
    init(providedBase: String = "",
         providedExponent: String = "",
         recoverySuggestion: String = ""
    ) {
        self.providedBase = providedBase
        self.providedExponent = providedExponent
        self.recoverySuggestion = recoverySuggestion
    }
}

