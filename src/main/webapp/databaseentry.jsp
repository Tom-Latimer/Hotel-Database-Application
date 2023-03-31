<html>
    <head>
        <title>DatabaseEntry</title>
        <link rel = "stylesheet" href = "./databaseentry.css">
        <link href = "https://fonts.cdnfonts.com/css/glacial-indifference-2" rel = "stylesheet">
        <link rel = "stylesheet" href = "https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    </head>

    <body>
        <div class = "topnav" id = "myTopnav">
            <img src = "avainreal.png" alt = "logoimage" class = "centerlogo">
            <a href = "#"><i class="fa fa-fw fa-info"></i>about</a>
            <a href = "#"><i class="fa fa-fw fa-envelope"></i>contact</a>
            <a href = "#"><i class="fa fa-fw fa-home"></i>home</a>
            <a href = "javascript:void(0);" class = "icon" onclick = "TopNav()">
                <i class="fa fa-fw fa-bars"></i>
            </a>
        </div>

        <div class = "main" id = "content main">
            <div id = "ReturnButton" hidden = "true">
                <button class = "button backbutton" onclick = "ReturnTableDropAdd()"><i class="fa fa-fw fa-arrow-left"></i>Return to Tables</button>
            </div>

            <div class = "centerelements" id = "content">

                <div id = "AddTable">
                    <form name = "TableDropAdd" id = "TableDropAdd">
                        <label for = "TableSelect">Choose a table to add to:</label>
                        <select id = "TableSelect" name = "TableSelect" onchange = "DisplayTable()" style = "margin-top: 5%;">
                            <option value = "defaultselect">Choose a table</option>
                            <option value = "Hotel_Chain">Hotel Chain</option>
                            <option value = "Hotel">Hotel</option>
                            <option value = "Room">Room</option>
                            <option value = "Amenity">Amenity</option>
                            <option value = "Problem">Problem</option>
                            <option value = "Employee">Employee</option>
                            <option value = "Customer">Customer</option>
                            <option value = "Renting">Renting</option>
                            <option value = "Booking">Booking</option>
                            <option value = "Works">Works</option>
                            <option value = "Manages">Manages</option>
                            <option value = "Creates">Creates</option>
                            <option value = "Pays">Pays</option>
                            <option value = "Rents">Rents</option>
                            <option value = "Books">Books</option>
                            <option value = "Reserves">Reserves</option>
                            <option value = "Registers">Registers</option>
                        </select>
                    </form>

                    <div id = "Hotel_Chain" hidden = "true">
                        <form>
                            <label for = "Hotel_Chain-chain_name">Chain name:</label>
                            <input type = "text" id = "Hotel_Chain-chain_name" name = "chain_name" placeholder = "Chain Name" minlength = "1" maxlength = "20" required><br>

                            <label for = "Hotel_Chain-street_number">Street Number:</label>
                            <input type = "number" id = "Hotel_Chain-street_number" name = "street_number" placeholder = "Street Number" min = "1" max = "9999" required><br>

                            <label for = "Hotel_Chain-street_name">Street Name:</label>
                            <input type = "text" id = "Hotel_Chain-street_name" name = "street_name" placeholder = "Street Name" minlength = "1" required><br>

                            <label for = "Hotel_Chain-city">City:</label>
                            <input type = "text" id = "Hotel_Chain-city" name = "city" placeholder = "City" minlength = "1" required><br>

                            <label for = "Hotel_Chain-province">Province:</label>
                            <select id = "Hotel_Chain-province" name = "province">
                                <option value = "defaultprovince">Choose a province</option>
                                <option value = "AB">AB</option>
                                <option value = "BC">BC</option>
                                <option value = "MB">MB</option>
                                <option value = "NB">NB</option>
                                <option value = "NL">NL</option>
                                <option value = "NS">NS</option>
                                <option value = "NT">NT</option>
                                <option value = "NU">NU</option>
                                <option value = "ON	">ON</option>
                                <option value = "PE">PE</option>
                                <option value = "QC">QC</option>
                                <option value = "SK">SK</option>
                                <option value = "YT">YT</option>
                            </select>

                            <label for = "Hotel_Chain-postal">Postal Code:</label>
                            <input type = "text" id = "Hotel_Chain-postal" name = "postal" placeholder = "Postal Code" minlength = "1" maxlength = "6" required><br>

                            <label for = "Hotel_Chain-Phone_numbers">Phone Number:</label>
                            <input type = "text" id = "Hotel_Chain-Phone_numbers" name = "Phone_numbers" placeholder = "Phone Number" minlength = "1" required><br>

                            <label for = "Hotel_Chain-email_addresses">Email Address:</label>
                            <input type = "text" id = "Hotel_Chain-email_addresses" name = "email_addresses" placeholder = "Email Address" minlength = "1" required><br>

                            <input type = "submit" value = "Submit">
                        </form>
                    </div>

                    <div id = "Hotel" hidden = "true">

                        <form>
                            <label for = "Hotel-chain_name">Chain name:</label>
                            <input type = "text" id = "Hotel-chain_name" name = "chain_name" placeholder = "Chain Name" minlength = "1" maxlength = "20" required><br>

                            <label for = "Hotel-name">Hotel name:</label>
                            <input type = "text" id = "Hotel-name" name = "name" placeholder = "Hotel Name" minlength = "1" maxlength = "20" required><br>

                            <label for = "Hotel-rating">Rating:</label>
                            <input type = "number" id = "Hotel-rating" name = "rating" placeholder = "Rating" min = "1" max = "5" step = ".1" required><br>

                            <label for = "Hotel-street_number">Street Number:</label>
                            <input type = "number" id = "Hotel-street_number" name = "street_number" placeholder = "Street Number" min = "1" max = "9999" required><br>

                            <label for = "Hotel-street_name">Street Name:</label>
                            <input type = "text" id = "Hotel-street_name" name = "street_name" placeholder = "Street Name" minlength = "1" required><br>

                            <label for = "Hotel-city">City:</label>
                            <input type = "text" id = "Hotel-city" name = "city" placeholder = "City" minlength = "1" required><br>

                            <label for = "Hotel-province">Province:</label>
                            <select id = "Hotel-province" name = "province">
                                <option value = "AB">AB</option>
                                <option value = "BC">BC</option>
                                <option value = "MB">MB</option>
                                <option value = "NB">NB</option>
                                <option value = "NL">NL</option>
                                <option value = "NS">NS</option>
                                <option value = "NT">NT</option>
                                <option value = "NU">NU</option>
                                <option value = "ON	">ON</option>
                                <option value = "PE">PE</option>
                                <option value = "QC">QC</option>
                                <option value = "SK">SK</option>
                                <option value = "YT">YT</option>
                            </select>

                            <label for = "Hotel-postal">Postal Code:</label>
                            <input type = "text" id = "Hotel-postal" name = "postal" placeholder = "Postal Code" minlength = "1" maxlength = "6" required><br>

                            <label for = "Hotel-Phone_numbers">Phone Number:</label>
                            <input type = "text" id = "Hotel-Phone_numbers" name = "Phone_numbers" placeholder = "Phone Number" minlength = "1" required><br>

                            <label for = "Hotel-email_addresses">Email Address:</label>
                            <input type = "text" id = "Hotel-email_addresses" name = "email_addresses" placeholder = "Email Address" minlength = "1" required><br>

                            <input type = "submit" value = "Submit">
                        </form>
                    </div>

                    <div id = "Room" hidden = "true">
                        <form>
                            <label for = "Room-chain_name">Chain name:</label>
                            <input type = "text" id = "Room-chain_name" name = "chain_name" placeholder = "Chain Name" minlength = "1" maxlength = "20" required><br>

                            <label for = "Room-hotel_id">Hotel ID:</label>
                            <input type = "number" id = "Room-hotel_id" name = "hotel_id" placeholder = "Hotel ID" min = "0" required><br>

                            <label for = "Room-price">Price:</label>
                            <input type = "number" id = "Room-hotel_id" name = "hotel_id" placeholder = "Price" min = "0" max = "99999" step = "0.01" required><br>

                            <label for = "Room-capacity">Capacity:</label>
                            <input type = "number" id = "Room-hotel_id" name = "hotel_id" placeholder = "Capacity" min = "1" required><br>

                            <label for = "Room-view_type">View type:</label>
                            <select id = "Room-view_type" name = "view_type">
                                <option value = "true">Sea View</option>
                                <option value = "false">Mountain View</option>
                            </select>

                            <label for = "Room-availability">Room Availability:</label>
                            <select id = "Room-availability" name = "availability">
                                <option value = "true">Available</option>
                                <option value = "false">Not Available</option>
                            </select>

                            <input type = "submit" value = "Submit">
                        </form>
                    </div>

                    <div id = "Amenity" hidden = "true">
                        <form>
                            <label for = "Amenity-chain_name">Chain name:</label>
                            <input type = "text" id = "Amenity-chain_name" name = "chain_name" placeholder = "Chain Name" minlength = "1" maxlength = "20" required><br>

                            <label for = "Amenity-hotel_id">Hotel ID:</label>
                            <input type = "number" id = "Amenity-hotel_id" name = "hotel_id" placeholder = "Hotel ID" min = "0" required><br>

                            <label for = "Amenity-room_id">Room ID:</label>
                            <input type = "number" id = "Amenity-room_id" name = "room_id" placeholder = "Room ID" min = "0" required><br>

                            <label for = "Amenity-amen_type">Amenity:</label>
                            <input type = "text" id = "Amenity-amen_type" name = "amen_type" placeholder = "Amenity" minlength = "1" maxlength = "20" required><br>

                            <input type = "submit" value = "Submit">
                        </form>
                    </div>

                    <div id = "Problem" hidden = "true">
                        <form>
                            <label for = "Problem-chain_name">Chain name:</label>
                            <input type = "text" id = "Problem-chain_name" name = "chain_name" placeholder = "Chain Name" minlength = "1" maxlength = "20" required><br>

                            <label for = "Problem-hotel_id">Hotel ID:</label>
                            <input type = "number" id = "Problem-hotel_id" name = "hotel_id" placeholder = "Hotel ID" min = "0" required><br>

                            <label for = "Problem-room_id">Room ID:</label>
                            <input type = "number" id = "Problem-room_id" name = "room_id" placeholder = "Room ID" min = "0" required><br>

                            <label for = "Problem-prob_type">Problem:</label>
                            <input type = "text" id = "Problem-prob_type" name = "amen_type" placeholder = "Problem" minlength = "1" maxlength = "20" required><br>

                            <input type = "submit" value = "Submit">
                        </form>
                    </div>

                    <div id = "Employee" hidden = "true">
                        <form>
                            <label for = "Employee-ssn">SSN:</label>
                            <input type = "number" id = "Employee-ssn" name = "ssn" placeholder = "SSN" min = "0" max = "999999999"required><br>

                            <label for = "Employee-first_name">First name:</label>
                            <input type = "text" id = "Employee-first_name" name = "first_name" placeholder = "First name" minlength = "1" required><br>

                            <label for = "Employee-last_name">Last name:</label>
                            <input type = "text" id = "Employee-last_name" name = "last_name" placeholder = "Last name" minlength = "1" required><br>

                            <label for = "Employee-street_number">Street Number:</label>
                            <input type = "number" id = "Employee-street_number" name = "street_number" placeholder = "Street Number" min = "1" max = "9999" required><br>

                            <label for = "Employee-street_name">Street Name:</label>
                            <input type = "text" id = "Employee-street_name" name = "street_name" placeholder = "Street Name" minlength = "1" required><br>

                            <label for = "Employee-city">City:</label>
                            <input type = "text" id = "Employee-city" name = "city" placeholder = "City" minlength = "1" required><br>

                            <label for = "Employee-province">Province:</label>
                            <select id = "Employee-province" name = "province">
                                <option value = "AB">AB</option>
                                <option value = "BC">BC</option>
                                <option value = "MB">MB</option>
                                <option value = "NB">NB</option>
                                <option value = "NL">NL</option>
                                <option value = "NS">NS</option>
                                <option value = "NT">NT</option>
                                <option value = "NU">NU</option>
                                <option value = "ON	">ON</option>
                                <option value = "PE">PE</option>
                                <option value = "QC">QC</option>
                                <option value = "SK">SK</option>
                                <option value = "YT">YT</option>
                            </select>

                            <label for = "Employee-role">Employee role:</label>
                            <input type = "text" id = "Employee-role" name = "role" placeholder = "Employee role" minlength = "1" required><br>

                            <input type = "submit" value = "Submit">
                        </form>
                    </div>

                    <div id = "Customer" hidden = "true">
                        <form>
                            <label for = "Customer-ssn">SSN:</label>
                            <input type = "number" id = "Customer-ssn" name = "ssn" placeholder = "SSN" min = "0" max = "999999999"required><br>

                            <label for = "Customer-first_name">First name:</label>
                            <input type = "text" id = "Customer-first_name" name = "first_name" placeholder = "First name" minlength = "1" required><br>

                            <label for = "Customer-last_name">Last name:</label>
                            <input type = "text" id = "Customer-last_name" name = "last_name" placeholder = "Last name" minlength = "1" required><br>

                            <label for = "Customer-street_number">Street Number:</label>
                            <input type = "number" id = "Customer-street_number" name = "street_number" placeholder = "Street Number" min = "1" max = "9999" required><br>

                            <label for = "Customer-street_name">Street Name:</label>
                            <input type = "text" id = "Customer-street_name" name = "street_name" placeholder = "Street Name" minlength = "1" required><br>

                            <label for = "Customer-city">City:</label>
                            <input type = "text" id = "Customer-city" name = "city" placeholder = "City" minlength = "1" required><br>

                            <label for = "Customer-province">Province:</label>
                            <select id = "Customer-province" name = "province">
                                <option value = "AB">AB</option>
                                <option value = "BC">BC</option>
                                <option value = "MB">MB</option>
                                <option value = "NB">NB</option>
                                <option value = "NL">NL</option>
                                <option value = "NS">NS</option>
                                <option value = "NT">NT</option>
                                <option value = "NU">NU</option>
                                <option value = "ON	">ON</option>
                                <option value = "PE">PE</option>
                                <option value = "QC">QC</option>
                                <option value = "SK">SK</option>
                                <option value = "YT">YT</option>
                            </select>

                            <label for = "Customer-date_of_registration">Date of Registration:</label>
                            <input type = "date" id = "Customer-date_of_registration" name = "date_of_registration" placeholder = "Date of Registration" minlength = "1" required><br>

                            <input type = "submit" value = "Submit">
                        </form>
                    </div>

                    <div id = "Renting" hidden = "true">
                        <form>
                            <label for = "Renting-start_date">Date of Registration:</label>
                            <input type = "date" id = "Renting-start_date" name = "start_date" placeholder = "Start Date" minlength = "1" required><br>

                            <label for = "Renting-end_date">Date of Registration:</label>
                            <input type = "date" id = "Renting-end_date" name = "end_date" placeholder = "End Date" minlength = "1" required><br>

                            <label for = "Renting-cost">Cost:</label>
                            <input type = "number" id = "Renting-cost" name = "cost" placeholder = "Cost" min = "0" max = "99999" step = "0.01" required><br>

                            <input type = "submit" value = "Submit">
                        </form>
                    </div>

                    <div id = "Booking" hidden = "true">
                        <form>
                            <label for = "Booking-start_date">Date of Registration:</label>
                            <input type = "date" id = "Booking-start_date" name = "start_date" placeholder = "Start Date" minlength = "1" required><br>

                            <label for = "Booking-end_date">Date of Registration:</label>
                            <input type = "date" id = "Booking-end_date" name = "end_date" placeholder = "End Date" minlength = "1" required><br>

                            <label for = "Booking-cost">Cost:</label>
                            <input type = "number" id = "Booking-cost" name = "cost" placeholder = "Cost" min = "0" max = "99999" step = "0.01" required><br>

                            <input type = "submit" value = "Submit">
                        </form>
                    </div>

                    <div id = "Works" hidden = "true">
                        <form>
                            <label for = "Works-ssn">SSN:</label>
                            <input type = "number" id = "Works-ssn" name = "ssn" placeholder = "SSN" min = "0" max = "999999999"required><br>

                            <label for = "Works-hotel_id">Hotel ID:</label>
                            <input type = "number" id = "Works-hotel_id" name = "hotel_id" placeholder = "Hotel ID" min = "0" required><br>

                            <label for = "Works-chain_name">Chain name:</label>
                            <input type = "text" id = "Works-chain_name" name = "chain_name" placeholder = "Chain Name" minlength = "1" maxlength = "20" required><br>

                            <input type = "submit" value = "Submit">
                        </form>
                    </div>

                    <div id = "Manages" hidden = "true">
                        <form>
                            <label for = "Manages-ssn">SSN:</label>
                            <input type = "number" id = "Manages-ssn" name = "ssn" placeholder = "SSN" min = "0" max = "999999999"required><br>

                            <label for = "Manages-hotel_id">Hotel ID:</label>
                            <input type = "number" id = "Manages-hotel_id" name = "hotel_id" placeholder = "Hotel ID" min = "0" required><br>

                            <label for = "Manages-chain_name">Chain name:</label>
                            <input type = "text" id = "Manages-chain_name" name = "chain_name" placeholder = "Chain Name" minlength = "1" maxlength = "20" required><br>

                            <input type = "submit" value = "Submit">
                        </form>
                    </div>

                    <div id = "Creates" hidden = "true">
                        <form>
                            <label for = "Creates-ssn">SSN:</label>
                            <input type = "number" id = "Creates-ssn" name = "ssn" placeholder = "SSN" min = "0" max = "999999999"required><br>

                            <label for = "Creates-rent_id">Hotel ID:</label>
                            <input type = "number" id = "Creates-rent_id" name = "rent_id" placeholder = "Rent ID" min = "0" required><br>

                            <input type = "submit" value = "Submit">
                        </form>
                    </div>

                    <div id = "Pays" hidden = "true">
                        <form>
                            <label for = "Pays-ssn">SSN:</label>
                            <input type = "number" id = "Pays-ssn" name = "ssn" placeholder = "SSN" min = "0" max = "999999999"required><br>

                            <label for = "Pays-rent_id">Hotel ID:</label>
                            <input type = "number" id = "Pays-rent_id" name = "rent_id" placeholder = "Rent ID" min = "0" required><br>

                            <input type = "submit" value = "Submit">
                        </form>
                    </div>

                    <div id = "Rents" hidden = "true">
                        <form>
                            <label for = "Rents-rent_id">Hotel ID:</label>
                            <input type = "number" id = "Rents-rent_id" name = "rent_id" placeholder = "Rent ID" min = "0" required><br>

                            <label for = "Rents-chain_name">Chain name:</label>
                            <input type = "text" id = "Rents-chain_name" name = "chain_name" placeholder = "Chain Name" minlength = "1" maxlength = "20" required><br>

                            <label for = "Rents-hotel_id">Hotel ID:</label>
                            <input type = "number" id = "Rents-hotel_id" name = "hotel_id" placeholder = "Hotel ID" min = "0" required><br>

                            <label for = "Rents-room_id">Room ID:</label>
                            <input type = "number" id = "Rents-room_id" name = "room_id" placeholder = "Room ID" min = "0" required><br>

                            <input type = "submit" value = "Submit">
                        </form>
                    </div>

                    <div id = "Books" hidden = "true">
                        <form>
                            <label for = "Books-booking_id">Booking ID:</label>
                            <input type = "number" id = "Books-booking_id" name = "booking_id" placeholder = "Booking ID" min = "0" required><br>

                            <label for = "Books-chain_name">Chain name:</label>
                            <input type = "text" id = "Books-chain_name" name = "chain_name" placeholder = "Chain Name" minlength = "1" maxlength = "20" required><br>

                            <label for = "Books-hotel_id">Hotel ID:</label>
                            <input type = "number" id = "Books-hotel_id" name = "hotel_id" placeholder = "Hotel ID" min = "0" required><br>

                            <label for = "Books-room_id">Room ID:</label>
                            <input type = "number" id = "Books-room_id" name = "room_id" placeholder = "Room ID" min = "0" required><br>

                            <input type = "submit" value = "Submit">
                        </form>
                    </div>

                    <div id = "Reserves" hidden = "true">
                        <form>
                            <label for = "Reserves-ssn">SSN:</label>
                            <input type = "number" id = "Reserves-ssn" name = "ssn" placeholder = "SSN" min = "0" max = "999999999"required><br>

                            <label for = "Reserves-booking_id">Booking ID:</label>
                            <input type = "number" id = "Reserves-booking_id" name = "booking_id" placeholder = "Booking ID" min = "0" required><br>

                            <input type = "submit" value = "Submit">
                        </form>
                    </div>

                    <div id = "Registers" hidden = "true">
                        <form>
                            <label for = "Registers-ssn">SSN:</label>
                            <input type = "number" id = "Registers-ssn" name = "ssn" placeholder = "SSN" min = "0" max = "999999999"required><br>

                            <label for = "Registers-booking_id">Booking ID:</label>
                            <input type = "number" id = "Registers-booking_id" name = "booking_id" placeholder = "Booking ID" min = "0" required><br>

                            <input type = "submit" value = "Submit">
                        </form>
                    </div>

                </div>

                <div id = "RemoveTable">

                </div>

                <div id = "EditTable">

                </div>

            </div>
        </div>



    </body>

    <script>
        function TopNav() {
            var x = document.getElementById("myTopnav");
            if (x.className === "topnav") {
                x.className += " responsive";
            }
            else {
                x.className = "topnav";
            }
        }

        function DisplayTable() {
            const SelectedTable = document.querySelector('#TableSelect').value;
            document.getElementById('ReturnButton').hidden = false;
            document.getElementById(SelectedTable).hidden = false;
            document.getElementById('TableDropAdd').hidden = true;
        }

        function ReturnTableDropAdd() {
            const SelectedTable = document.querySelector('#TableSelect').value;
            document.getElementById('ReturnButton').hidden = true;
            document.getElementById(SelectedTable).hidden = true;
            document.getElementById('TableDropAdd').hidden = false;


        }
    </script>

</html>
