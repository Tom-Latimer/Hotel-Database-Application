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
                            <option value = "Create">Create</option>
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

                    </div>

                    <div id = "Amenity" hidden = "true">

                    </div>

                    <div id = "Problem" hidden = "true">

                    </div>

                    <div id = "Employee" hidden = "true">

                    </div>

                    <div id = "Customer" hidden = "true">

                    </div>

                    <div id = "Renting" hidden = "true">

                    </div>

                    <div id = "Booking" hidden = "true">

                    </div>

                    <div id = "Works" hidden = "true">

                    </div>

                    <div id = "Manages" hidden = "true">

                    </div>

                    <div id = "Create" hidden = "true">

                    </div>

                    <div id = "Pays" hidden = "true">

                    </div>

                    <div id = "Rents" hidden = "true">

                    </div>

                    <div id = "Books" hidden = "true">

                    </div>

                    <div id = "Reserves" hidden = "true">

                    </div>

                    <div id = "Registers" hidden = "true">

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