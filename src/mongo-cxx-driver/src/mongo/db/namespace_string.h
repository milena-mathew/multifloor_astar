// @file namespacestring.h

/*    Copyright 2014 MongoDB Inc.
 *
 *    Licensed under the Apache License, Version 2.0 (the "License");
 *    you may not use this file except in compliance with the License.
 *    You may obtain a copy of the License at
 *
 *    http://www.apache.org/licenses/LICENSE-2.0
 *
 *    Unless required by applicable law or agreed to in writing, software
 *    distributed under the License is distributed on an "AS IS" BASIS,
 *    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 *    See the License for the specific language governing permissions and
 *    limitations under the License.
 */

#pragma once

#include <algorithm>
#include <string>

#include "mongo/base/string_data.h"
#include "mongo/util/assert_util.h"

namespace mongo {

    /* in the mongo source code, "client" means "database". */

    const size_t MaxDatabaseNameLen = 128; // max str len for the db name, including null char

    /* e.g.
       NamespaceString ns("acme.orders");
       cout << ns.coll; // "orders"
    */
    class NamespaceString {
    public:
        /**
         * Constructs an empty NamespaceString.
         */
        NamespaceString();

        /**
         * Constructs a NamespaceString from the fully qualified namespace named in "ns".
         */
        NamespaceString( const StringData& ns );

        /**
         * Constructs a NamespaceString for the given database and collection names.
         * "dbName" must not contain a ".", and "collectionName" must not start with one.
         */
        NamespaceString( const StringData& dbName, const StringData& collectionName );

        StringData db() const;
        StringData coll() const;

        const std::string& ns() const { return _ns; }

        operator std::string() const { return _ns; }
        std::string toString() const { return _ns; }

        size_t size() const { return _ns.size(); }

        bool isSystem() const { return coll().startsWith( "system." ); }
        bool isSystemDotIndexes() const { return coll() == "system.indexes"; }
        bool isConfigDB() const { return db() == "config"; }
        bool isCommand() const { return coll() == "$cmd"; }
        bool isOplog() const { return oplog( _ns ); }
        bool isSpecialCommand() const { return coll().startsWith("$cmd.sys"); }
        bool isSpecial() const { return special( _ns ); }
        bool isNormal() const { return normal( _ns ); }

        /**
         * @return true if the namespace is valid. Special namespaces for internal use are considered as valid.
         */
        bool isValid() const { return validDBName( db() ) && !coll().empty(); }

        bool operator==( const std::string& nsIn ) const { return nsIn == _ns; }
        bool operator==( const NamespaceString& nsIn ) const { return nsIn._ns == _ns; }

        bool operator!=( const std::string& nsIn ) const { return nsIn != _ns; }
        bool operator!=( const NamespaceString& nsIn ) const { return nsIn._ns != _ns; }

        bool operator<( const NamespaceString& rhs ) const { return _ns < rhs._ns; }

        /** ( foo.bar ).getSisterNS( "blah" ) == foo.blah
         */
        std::string getSisterNS( const StringData& local ) const;

        // @return db() + ".system.indexes"
        std::string getSystemIndexesCollection() const;

        // @return db() + ".$cmd"
        std::string getCommandNS() const;

        /**
         * @return true if ns is 'normal'.  A "$" is used for namespaces holding index data,
         * which do not contain BSON objects in their records. ("oplog.$main" is the exception)
         */
        static bool normal(const StringData& ns);

        /**
         * @return true if the ns is an oplog one, otherwise false.
         */
        static bool oplog(const StringData& ns);

        static bool special(const StringData& ns);

        /**
         * samples:
         *   good
         *      foo
         *      bar
         *      foo-bar
         *   bad:
         *      foo bar
         *      foo.bar
         *      foo"bar
         *
         * @param db - a possible database name
         * @return if db is an allowed database name
         */
        static bool validDBName( const StringData& dbin );

        /**
         * Takes a fully qualified namespace (ie dbname.collectionName), and returns true if
         * the collection name component of the namespace is valid.
         * samples:
         *   good:
         *      foo.bar
         *   bad:
         *      foo.
         *
         * @param ns - a full namespace (a.b)
         * @return if db.coll is an allowed collection name
         */
        static bool validCollectionComponent(const StringData& ns);

        /**
         * Takes a collection name and returns true if it is a valid collection name.
         * samples:
         *   good:
         *     foo
         *     system.indexes
         *   bad:
         *     $foo
         * @param coll - a collection name component of a namespace
         * @return if the input is a valid collection name
         */
        static bool validCollectionName(const StringData& coll);

    private:

        std::string _ns;
        size_t _dotIndex;
    };


    // "database.a.b.c" -> "database"
    inline StringData nsToDatabaseSubstring( const StringData& ns ) {
        size_t i = ns.find( '.' );
        if ( i == std::string::npos ) {
            massert(10078, "nsToDatabase: db too long", ns.size() < MaxDatabaseNameLen );
            return ns;
        }
        massert(10088, "nsToDatabase: db too long", i < static_cast<size_t>(MaxDatabaseNameLen));
        return ns.substr( 0, i );
    }

    // "database.a.b.c" -> "database"
    inline void nsToDatabase(const StringData& ns, char *database) {
        StringData db = nsToDatabaseSubstring( ns );
        db.copyTo( database, true );
    }

    // TODO: make this return a StringData
    inline std::string nsToDatabase(const StringData& ns) {
        return nsToDatabaseSubstring( ns ).toString();
    }

    // "database.a.b.c" -> "a.b.c"
    inline StringData nsToCollectionSubstring( const StringData& ns ) {
        size_t i = ns.find( '.' );
        massert(16886, "nsToCollectionSubstring: no .", i != std::string::npos );
        return ns.substr( i + 1 );
    }


    /**
     * NamespaceDBHash and NamespaceDBEquals allow you to do something like
     * unordered_map<string,int,NamespaceDBHash,NamespaceDBEquals>
     * and use the full namespace for the string
     * but comparisons are done only on the db piece
     */

    /**
     * this can change, do not store on disk
     */
    int nsDBHash( const std::string& ns );

    bool nsDBEquals( const std::string& a, const std::string& b );

    struct NamespaceDBHash {
        int operator()( const std::string& ns ) const {
            return nsDBHash( ns );
        }
    };

    struct NamespaceDBEquals {
        bool operator()( const std::string& a, const std::string& b ) const {
            return nsDBEquals( a, b );
        }
    };

}


#include "mongo/db/namespace_string-inl.h"
