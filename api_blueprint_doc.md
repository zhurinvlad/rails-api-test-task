# GET /v1/auth_token

+ Request

    + Headers

            Authorization: Basic ZGV2ZWxvcDRuZXRAZ21haWwuY29tOioqKioqIEhpZGRlbiBjcmVkZW50aWFscyAqKioqKg==



+ Response 200 (application/json; charset=utf-8)

    + Headers

            X-Content-Type-Options: nosniff
            Vary: Origin
            Etag: W/"e604a7da73ea5ff75ae6d08f7e2a343e"
            X-Frame-Options: SAMEORIGIN
            X-XSS-Protection: 1; mode=block
            X-Request-Id: c4c1a5cd-c330-4953-af2a-a8cae9f9c623
            X-Runtime: 0.114096
            Cache-Control: max-age=0, private, must-revalidate
            Transfer-Encoding: chunked

    + Body

            {"auth_token":"af3cb706fed4be155a8d648f12061eea"}


# GET /v1/auth_token

+ Request

    + Headers

            Authorization: Basic QGdtYWlsMS5jb206KioqKiogSGlkZGVuIGNyZWRlbnRpYWxzICoqKioq



+ Response 401 (application/json; charset=utf-8)

    + Headers

            X-Content-Type-Options: nosniff
            Vary: Origin
            X-Frame-Options: SAMEORIGIN
            X-XSS-Protection: 1; mode=block
            X-Request-Id: 271e8ed5-7303-4bb1-8f6e-6a3427548650
            X-Runtime: 0.005258
            Cache-Control: no-cache
            Transfer-Encoding: chunked

    + Body

            {"errors":{"access":"Incorrect credentials"}}


# GET /v1/authorized_user

+ Request (application/json; charset=utf-8)

    + Headers

            Authorization: Token token=af3cb706fed4be155a8d648f12061eea

    + Body

            {
                "author": {
                    "first_name": "Paolo",
                    "last_name": "Perrotta",
                    "about": "Software loudmouth, team coach, author of the Metaprogramming Ruby book"
                }
            }

+ Response 200 (application/json; charset=utf-8)

    + Headers

            X-Content-Type-Options: nosniff
            Vary: Origin
            Etag: W/"2552d4e967f8153f20084f4c2beb69e8"
            X-Frame-Options: SAMEORIGIN
            X-XSS-Protection: 1; mode=block
            X-Request-Id: bd06b43d-8775-43aa-ac1f-5c9177d9820a
            X-Runtime: 0.003852
            Cache-Control: max-age=0, private, must-revalidate
            Transfer-Encoding: chunked

    + Body

            {"user":{"id":1,"first_name":"Andrey","last_name":"Krisanov","email":"develop4net@gmail.com","birthday":"1989-12-15","website":"http://akrisanov.com","about":"Software Engineer"}}


# GET /v1/users

+ Response 200 (application/json; charset=utf-8)

    + Headers

            X-Content-Type-Options: nosniff
            Vary: Origin
            Etag: W/"c5a3e7c0caac9bf904587da3a890d068"
            X-Frame-Options: SAMEORIGIN
            X-XSS-Protection: 1; mode=block
            X-Request-Id: 859bdfdd-b889-4002-ab01-f9baaab032f7
            X-Runtime: 0.017745
            Cache-Control: max-age=0, private, must-revalidate
            Transfer-Encoding: chunked

    + Body

            {"users":[{"id":1,"first_name":"Andrey","last_name":"Krisanov","email":"develop4net@gmail.com","birthday":"1989-12-15","website":"http://akrisanov.com","about":"Software Engineer"}]}


# POST /v1/users

+ Request (application/json; charset=utf-8)

        {
            "user": {
                "first_name": "Maria",
                "last_name": "Krisanova",
                "email": "mkrisanova@test.com",
                "password": "pWdsN47qgZ",
                "birthday": "1988-12-15",
                "website": "https://google.com",
                "about": "I like books!"
            }
        }

+ Response 401 (application/json; charset=utf-8)

    + Headers

            X-Content-Type-Options: nosniff
            Vary: Origin
            X-Frame-Options: SAMEORIGIN
            X-XSS-Protection: 1; mode=block
            X-Request-Id: c8e71e76-a873-44d7-9926-98fec07c9080
            X-Runtime: 0.002332
            Cache-Control: no-cache
            Transfer-Encoding: chunked

    + Body

            {"errors":{"access":"Invalid token"}}


# POST /v1/users

+ Request (application/json; charset=utf-8)

    + Headers

            Authorization: Token token=af3cb706fed4be155a8d648f12061eea

    + Body

            {
                "user": {
                    "first_name": "Maria",
                    "last_name": "Krisanova",
                    "email": "mkrisanova@test.com",
                    "password": "pWdsN47qgZ",
                    "birthday": "1988-12-15",
                    "website": "https://google.com",
                    "about": "I like books!"
                }
            }

+ Response 201 (application/json; charset=utf-8)

    + Headers

            X-Runtime: 0.072916
            X-XSS-Protection: 1; mode=block
            Transfer-Encoding: chunked
            Cache-Control: max-age=0, private, must-revalidate
            Location: /v1/users/3
            X-Request-Id: acfab6b4-a67b-41db-918f-c3d9936f7961
            X-Content-Type-Options: nosniff
            Etag: W/"54be4ca207f3b250a58c01b8303090b4"
            Vary: Origin
            X-Frame-Options: SAMEORIGIN

    + Body

            {"user":{"id":3,"first_name":"Maria","last_name":"Krisanova","email":"mkrisanova@test.com","birthday":"1988-12-15","website":"https://google.com","about":"I like books!"}}


# POST /v1/users

+ Request (application/json; charset=utf-8)

    + Headers

            Authorization: Token token=af3cb706fed4be155a8d648f12061eea

    + Body

            {
                "user": {
                    "first_name": "Maria",
                    "last_name": "Krisanova",
                    "email": "mkrisanova@test.com",
                    "password": "pWdsN47qgZ",
                    "birthday": "1988-12-15",
                    "website": "https://google.com",
                    "about": "I like books!"
                }
            }

+ Response 422 (application/json; charset=utf-8)

    + Headers

            X-Content-Type-Options: nosniff
            Vary: Origin
            X-Frame-Options: SAMEORIGIN
            X-XSS-Protection: 1; mode=block
            X-Request-Id: d6add5fc-37e2-45bc-874e-aa5710e72144
            X-Runtime: 0.074062
            Cache-Control: no-cache
            Transfer-Encoding: chunked

    + Body

            {"errors":{"email":["has already been taken"],"first_name":["has already been taken"]}}


# GET /v1/users/1

+ Response 200 (application/json; charset=utf-8)

    + Headers

            X-Content-Type-Options: nosniff
            Vary: Origin
            Etag: W/"2552d4e967f8153f20084f4c2beb69e8"
            X-Frame-Options: SAMEORIGIN
            X-XSS-Protection: 1; mode=block
            X-Request-Id: 325b4b81-eaf7-446a-b6d7-c9bbd6938c96
            X-Runtime: 0.002500
            Cache-Control: max-age=0, private, must-revalidate
            Transfer-Encoding: chunked

    + Body

            {"user":{"id":1,"first_name":"Andrey","last_name":"Krisanov","email":"develop4net@gmail.com","birthday":"1989-12-15","website":"http://akrisanov.com","about":"Software Engineer"}}


# PUT /v1/users/2

+ Request (application/json; charset=utf-8)

    + Headers

            Authorization: Token token=af3cb706fed4be155a8d648f12061eea

    + Body

            {
                "user": {
                    "website": "http://akrisanov.com"
                }
            }

+ Response 200 (application/json; charset=utf-8)

    + Headers

            X-Content-Type-Options: nosniff
            Vary: Origin
            Etag: W/"bce51b406bf6ac45af08e33bdfc32aec"
            X-Frame-Options: SAMEORIGIN
            X-XSS-Protection: 1; mode=block
            X-Request-Id: 0b90ceae-46ba-4ed4-b861-1be8d6fda484
            X-Runtime: 0.008017
            Cache-Control: max-age=0, private, must-revalidate
            Transfer-Encoding: chunked

    + Body

            {"user":{"id":2,"first_name":"Maria","last_name":"Krisanova","email":"mkrisanova@test.com","birthday":"1988-12-15","website":"http://akrisanov.com","about":"I like books!"}}


# DELETE /v1/users/2

+ Request (application/json; charset=utf-8)

    + Headers

            Authorization: Token token=af3cb706fed4be155a8d648f12061eea

    + Body

            {}

+ Response 204

    + Headers

            X-Content-Type-Options: nosniff
            Vary: Origin
            X-Frame-Options: SAMEORIGIN
            X-XSS-Protection: 1; mode=block
            X-Request-Id: 9f93d260-e657-4aff-ab20-1f0947b3c2c6
            X-Runtime: 0.013109
            Cache-Control: no-cache




# GET /v1/authors

+ Response 200 (application/json; charset=utf-8)

    + Headers

            X-Content-Type-Options: nosniff
            Vary: Origin
            Etag: W/"c135033ead462535b7d6179772ac585e"
            X-Frame-Options: SAMEORIGIN
            X-XSS-Protection: 1; mode=block
            X-Request-Id: b901798b-9bde-4d78-b69e-cf9252f37e3c
            X-Runtime: 0.003371
            Cache-Control: max-age=0, private, must-revalidate
            Transfer-Encoding: chunked

    + Body

            {"authors":[{"id":1,"first_name":"Sandi","last_name":"Metz","about":"Sandi Metz is a software developer and author focused on writing\n     flexible object-oriented code in Ruby and Rails"},{"id":2,"first_name":"Paolo","last_name":"Perrotta","about":"Software loudmouth, team coach, author of the Metaprogramming Ruby book"}]}


# GET /v1/authors/1/books

+ Response 200 (application/json; charset=utf-8)

    + Headers

            X-Content-Type-Options: nosniff
            Vary: Origin
            Etag: W/"697b884f60f59722d8c8b4c2a2cc7309"
            X-Frame-Options: SAMEORIGIN
            X-XSS-Protection: 1; mode=block
            X-Request-Id: 8d7b0860-38ef-4ef3-86f2-33fa6e8c51d6
            X-Runtime: 0.004962
            Cache-Control: max-age=0, private, must-revalidate
            Transfer-Encoding: chunked

    + Body

            {"books":[{"id":1,"isbn":"0321721330","title":"Practical Object Oriented Design in Ruby","description":"This book is spot on when it comes to object orientation.","pages":247,"website":"http://www.poodr.info/","published":"2012-08-19","author":{"id":1,"first_name":"Sandi","last_name":"Metz","about":"Sandi Metz is a software developer and author focused on writing\n     flexible object-oriented code in Ruby and Rails"}}]}


# POST /v1/authors

+ Request (application/json; charset=utf-8)

    + Headers

            Authorization: Token token=af3cb706fed4be155a8d648f12061eea

    + Body

            {
                "author": {
                    "first_name": "Paolo",
                    "last_name": "Perrotta",
                    "about": "Software loudmouth, team coach, author of the Metaprogramming Ruby book"
                }
            }

+ Response 201 (application/json; charset=utf-8)

    + Headers

            X-Runtime: 0.008091
            X-XSS-Protection: 1; mode=block
            Transfer-Encoding: chunked
            Cache-Control: max-age=0, private, must-revalidate
            Location: /v1/authors/4
            X-Request-Id: 6aa7e096-2ee6-41f0-80d4-2e0d56ee50b3
            X-Content-Type-Options: nosniff
            Etag: W/"01e7c61a5336e2f0ca9012d6a8e8b0f5"
            Vary: Origin
            X-Frame-Options: SAMEORIGIN

    + Body

            {"author":{"id":4,"first_name":"Paolo","last_name":"Perrotta","about":"Software loudmouth, team coach, author of the Metaprogramming Ruby book"}}


# GET /v1/authors/4

+ Response 200 (application/json; charset=utf-8)

    + Headers

            X-Content-Type-Options: nosniff
            Vary: Origin
            Etag: W/"01e7c61a5336e2f0ca9012d6a8e8b0f5"
            X-Frame-Options: SAMEORIGIN
            X-XSS-Protection: 1; mode=block
            X-Request-Id: 6d8a5677-71bd-48c6-9456-e8e364453da6
            X-Runtime: 0.002799
            Cache-Control: max-age=0, private, must-revalidate
            Transfer-Encoding: chunked

    + Body

            {"author":{"id":4,"first_name":"Paolo","last_name":"Perrotta","about":"Software loudmouth, team coach, author of the Metaprogramming Ruby book"}}


# PUT /v1/authors/3

+ Request (application/json; charset=utf-8)

    + Headers

            Authorization: Token token=af3cb706fed4be155a8d648f12061eea

    + Body

            {
                "author": {
                    "about": "Software loudmouth, team coach."
                }
            }

+ Response 200 (application/json; charset=utf-8)

    + Headers

            X-Content-Type-Options: nosniff
            Vary: Origin
            Etag: W/"2ff40d8aee83bb5b1eaa8c4b9ceaee77"
            X-Frame-Options: SAMEORIGIN
            X-XSS-Protection: 1; mode=block
            X-Request-Id: 1358093a-1bc9-4c70-8d10-5c5754c1d654
            X-Runtime: 0.008568
            Cache-Control: max-age=0, private, must-revalidate
            Transfer-Encoding: chunked

    + Body

            {"author":{"id":3,"first_name":"Paolo","last_name":"Perrotta","about":"Software loudmouth, team coach."}}


# DELETE /v1/authors/3

+ Request (application/json; charset=utf-8)

    + Headers

            Authorization: Token token=af3cb706fed4be155a8d648f12061eea

    + Body

            {}

+ Response 204

    + Headers

            X-Content-Type-Options: nosniff
            Vary: Origin
            X-Frame-Options: SAMEORIGIN
            X-XSS-Protection: 1; mode=block
            X-Request-Id: 19c99545-8093-40b2-a6b1-63cafe4b85fb
            X-Runtime: 0.009976
            Cache-Control: no-cache




# GET /v1/books

+ Response 200 (application/json; charset=utf-8)

    + Headers

            X-Content-Type-Options: nosniff
            Vary: Origin
            Etag: W/"697b884f60f59722d8c8b4c2a2cc7309"
            X-Frame-Options: SAMEORIGIN
            X-XSS-Protection: 1; mode=block
            X-Request-Id: 47b7879e-b29e-4b40-94d7-c0a09fcb4d48
            X-Runtime: 0.006908
            Cache-Control: max-age=0, private, must-revalidate
            Transfer-Encoding: chunked

    + Body

            {"books":[{"id":1,"isbn":"0321721330","title":"Practical Object Oriented Design in Ruby","description":"This book is spot on when it comes to object orientation.","pages":247,"website":"http://www.poodr.info/","published":"2012-08-19","author":{"id":1,"first_name":"Sandi","last_name":"Metz","about":"Sandi Metz is a software developer and author focused on writing\n     flexible object-oriented code in Ruby and Rails"}}]}


# POST /v1/books

+ Request (application/json; charset=utf-8)

    + Headers

            Authorization: Token token=af3cb706fed4be155a8d648f12061eea

    + Body

            {
                "book": {
                    "isbn": "1934356476",
                    "title": "Metaprogramming Ruby",
                    "description": "This book describes metaprogramming as an essential component of Ruby.",
                    "pages": "296",
                    "website": "https://www.goodreads.com/book/show/7183279-metaprogramming-ruby",
                    "published": "2010-02-22",
                    "author_id": "4"
                }
            }

+ Response 201 (application/json; charset=utf-8)

    + Headers

            X-Runtime: 0.016992
            X-XSS-Protection: 1; mode=block
            Transfer-Encoding: chunked
            Cache-Control: max-age=0, private, must-revalidate
            Location: /v1/books/3
            X-Request-Id: cb8e52d9-d5cb-4c7f-ab21-019f99c51c55
            X-Content-Type-Options: nosniff
            Etag: W/"661f2887042efbb72ad2daa3be9a2262"
            Vary: Origin
            X-Frame-Options: SAMEORIGIN

    + Body

            {"book":{"id":3,"isbn":"1934356476","title":"Metaprogramming Ruby","description":"This book describes metaprogramming as an essential component of Ruby.","pages":296,"website":"https://www.goodreads.com/book/show/7183279-metaprogramming-ruby","published":"2010-02-22","author":{"id":4,"first_name":"Paolo","last_name":"Perrotta","about":"Software loudmouth, team coach, author of the Metaprogramming Ruby book"}}}


# GET /v1/books/1

+ Response 200 (application/json; charset=utf-8)

    + Headers

            X-Content-Type-Options: nosniff
            Vary: Origin
            Etag: W/"0c2f6d40940d82907544db63c145ba4f"
            X-Frame-Options: SAMEORIGIN
            X-XSS-Protection: 1; mode=block
            X-Request-Id: ca81429f-d23d-4613-b5f6-d250309223f7
            X-Runtime: 0.013204
            Cache-Control: max-age=0, private, must-revalidate
            Transfer-Encoding: chunked

    + Body

            {"book":{"id":1,"isbn":"0321721330","title":"Practical Object Oriented Design in Ruby","description":"This book is spot on when it comes to object orientation.","pages":247,"website":"http://www.poodr.info/","published":"2012-08-19","author":{"id":1,"first_name":"Sandi","last_name":"Metz","about":"Sandi Metz is a software developer and author focused on writing\n     flexible object-oriented code in Ruby and Rails"}}}


# PUT /v1/books/3

+ Request (application/json; charset=utf-8)

    + Headers

            Authorization: Token token=af3cb706fed4be155a8d648f12061eea

    + Body

            {
                "book": {
                    "website": "https://pragprog.com/book/ppmetr2/metaprogramming-ruby-2"
                }
            }

+ Response 200 (application/json; charset=utf-8)

    + Headers

            X-Content-Type-Options: nosniff
            Vary: Origin
            Etag: W/"f111d61e8e614d95f17ec3617d388ce2"
            X-Frame-Options: SAMEORIGIN
            X-XSS-Protection: 1; mode=block
            X-Request-Id: 17155f13-882c-452f-a42b-bb02895f20b8
            X-Runtime: 0.007540
            Cache-Control: max-age=0, private, must-revalidate
            Transfer-Encoding: chunked

    + Body

            {"book":{"id":3,"isbn":"1934356476","title":"Metaprogramming Ruby","description":"This book describes metaprogramming as an essential component of Ruby.","pages":296,"website":"https://pragprog.com/book/ppmetr2/metaprogramming-ruby-2","published":"2010-02-22","author":{"id":4,"first_name":"Paolo","last_name":"Perrotta","about":"Software loudmouth, team coach, author of the Metaprogramming Ruby book"}}}


# DELETE /v1/books/2

+ Request (application/json; charset=utf-8)

    + Headers

            Authorization: Token token=af3cb706fed4be155a8d648f12061eea

    + Body

            {}

+ Response 204

    + Headers

            X-Content-Type-Options: nosniff
            Vary: Origin
            X-Frame-Options: SAMEORIGIN
            X-XSS-Protection: 1; mode=block
            X-Request-Id: 1267a71b-02fc-4ed1-b182-c9fc7fe31730
            X-Runtime: 0.010690
            Cache-Control: no-cache




# GET /v1/books/1/reviews

+ Response 200 (application/json; charset=utf-8)

    + Headers

            X-Content-Type-Options: nosniff
            Vary: Origin
            Etag: W/"265c64559b128a1d4d7650599ddcb5e9"
            X-Frame-Options: SAMEORIGIN
            X-XSS-Protection: 1; mode=block
            X-Request-Id: 0b0cffc6-f033-497e-900b-06c90f5c8b4e
            X-Runtime: 0.018751
            Cache-Control: max-age=0, private, must-revalidate
            Transfer-Encoding: chunked

    + Body

            {"reviews":[{"id":1,"text":"Awesome book!"}]}


# POST /v1/books/1/reviews

+ Request (application/json; charset=utf-8)

    + Headers

            Authorization: Token token=af3cb706fed4be155a8d648f12061eea

    + Body

            {
                "review": {
                    "text": "Best book ever"
                }
            }

+ Response 201 (application/json; charset=utf-8)

    + Headers

            X-Runtime: 0.007053
            X-XSS-Protection: 1; mode=block
            Transfer-Encoding: chunked
            Cache-Control: max-age=0, private, must-revalidate
            Location: /v1/books/6/reviews/1
            X-Request-Id: 10558f48-a023-4233-86d7-03014fc3c825
            X-Content-Type-Options: nosniff
            Etag: W/"54560ae1a395245935d2a0f07735e3fd"
            Vary: Origin
            X-Frame-Options: SAMEORIGIN

    + Body

            {"review":{"id":6,"text":"Best book ever","user":{"id":1,"first_name":"Andrey","last_name":"Krisanov","email":"develop4net@gmail.com","birthday":"1989-12-15","website":"http://akrisanov.com","about":"Software Engineer"}}}


# GET /v1/books/1/reviews/4

+ Response 200 (application/json; charset=utf-8)

    + Headers

            X-Content-Type-Options: nosniff
            Vary: Origin
            Etag: W/"cb6d962d8b6949d74325f54a3c218171"
            X-Frame-Options: SAMEORIGIN
            X-XSS-Protection: 1; mode=block
            X-Request-Id: d64542d6-48bd-4f92-a73e-9f0abadfb86b
            X-Runtime: 0.006324
            Cache-Control: max-age=0, private, must-revalidate
            Transfer-Encoding: chunked

    + Body

            {"review":{"id":4,"text":"Best book ever","user":{"id":1,"first_name":"Andrey","last_name":"Krisanov","email":"develop4net@gmail.com","birthday":"1989-12-15","website":"http://akrisanov.com","about":"Software Engineer"}}}


# PUT /v1/books/1/reviews/4

+ Request (application/json; charset=utf-8)

    + Headers

            Authorization: Token token=af3cb706fed4be155a8d648f12061eea

    + Body

            {
                "review": {
                    "text": "Worst book ever"
                }
            }

+ Response 200 (application/json; charset=utf-8)

    + Headers

            X-Content-Type-Options: nosniff
            Vary: Origin
            Etag: W/"0e2fe3bd0e2ea0d39008af804780abe3"
            X-Frame-Options: SAMEORIGIN
            X-XSS-Protection: 1; mode=block
            X-Request-Id: f929e448-05d6-481b-9f4a-e32ad5ca0d8f
            X-Runtime: 0.013136
            Cache-Control: max-age=0, private, must-revalidate
            Transfer-Encoding: chunked

    + Body

            {"review":{"id":4,"text":"Worst book ever","user":{"id":1,"first_name":"Andrey","last_name":"Krisanov","email":"develop4net@gmail.com","birthday":"1989-12-15","website":"http://akrisanov.com","about":"Software Engineer"}}}


# PUT /v1/books/1/reviews/5

+ Request (application/json; charset=utf-8)

    + Headers

            Authorization: Token token=af3cb706fed4be155a8d648f12061eea

    + Body

            {
                "review": {
                    "text": "Worst book ever"
                }
            }

+ Response 403 (application/json; charset=utf-8)

    + Headers

            X-Content-Type-Options: nosniff
            Vary: Origin
            X-Frame-Options: SAMEORIGIN
            X-XSS-Protection: 1; mode=block
            X-Request-Id: c24410bc-8f35-4fb8-9a29-340f47351ef3
            X-Runtime: 0.024558
            Cache-Control: no-cache
            Transfer-Encoding: chunked

    + Body

            {"errors":{"access":"Forbidden"}}


# DELETE /v1/books/1/reviews/4

+ Request (application/json; charset=utf-8)

    + Headers

            Authorization: Token token=af3cb706fed4be155a8d648f12061eea

    + Body

            {}

+ Response 204

    + Headers

            X-Content-Type-Options: nosniff
            Vary: Origin
            X-Frame-Options: SAMEORIGIN
            X-XSS-Protection: 1; mode=block
            X-Request-Id: 12315c69-c22e-46e3-8f66-bedda195deb2
            X-Runtime: 0.006183
            Cache-Control: no-cache
