import Foundation


struct Dictionary {
    
    var words = Set<String>()
    
}

enum NoMatch:Error {
    case noMatch
    case noInput
}


var dict = Dictionary(words: ["the","of","and","a","to","in","is","you","that","it","he","was","for","on","are","as","with","his","they","I","at","be","this","have","from","or","one","had","by","word","but","not","what","all","were","we","when","your","can","said","there","use","an","each","which","she","do","how","their","if","will","up","other","about","out","many","then","them","these","so","some","her","would","make","like","him","into","time","has","look","two","more","write","go","see","number","no","way","could","people","my","than","first","water","been","call","who","oil","its","now","find","long","down","day","did","get","come","made","may","part"])



func autocomplete(query:String, dictionary:Dictionary) throws -> Set<String> {
    
    guard let first = query.first else {throw NoMatch.noInput}  //get the first letter of query
    let charCount = query.count
    var found = Set<String>()   //set that will contain the matches
    
    for words in dictionary.words {         //loop through all the words
        
        if words.first! == first && charCount > 1 {       //check that the first letter is equal to the query string first letter
            if words.contains(query) {                          //also check that the count is greater than one
                found.insert(words)
            }
            continue
        }
        else if words.first! == first {             //else if the count is 1 and the first letters match , then just add the word
            found.insert(words)
        }
        
        
    }
    
    
    if found.count == 0 {
        throw NoMatch.noMatch
    }
    
    return found
    
    
}


try? autocomplete(query: "who", dictionary: dict)





//TESTING DOWN HERE FOR AN APPLICATION



var input:String? {
    didSet{                         //set up a property observer to call the function whenever value gets changed --set up for an application
        if let newInput = input {
            
            try? autocomplete(query: newInput, dictionary: dict)
            
        }
    }
}


input = "the"
