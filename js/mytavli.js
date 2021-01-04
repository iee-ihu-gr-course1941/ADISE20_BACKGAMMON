
var me = {token: null, piece_color: null, isfree: "0"};

var game_status = {};

var board = {};

var last_update = new Date().getTime();

var timer = null;

var zari1;
var zari2;
/*
το πλήθος των έγκυρων κινήσεων που έχουν γίνει με βάση την ζαριά
*/
var okMoves = [0,0,0,0];

/*
Ρυθμίζει την εμφάνιση της ιστοσελίδας με την είσοδο
*/
$(function () {
	
    draw_empty_board();
	
    fill_board();
	
    $('#tavli_login').click(login_to_game);
	
    $('#tavli_reset').click(reset_board);
	
	$('#tavli_end').click(game_status_update_to_null);
    $('#do_move').click(sendMove);
    $('#move_div').hide();
	$('#zari1').hide();
	$('#zari2').hide();
	$('#zari3').hide();
	$('#zari4').hide();
	$("#zari1").text("");
    $("#zari2").text("");
    $("#zari3").text("");
    $("#zari4").text("");
    

    game_status_update();
	
   
});
//ελέγχει αν έχει ολοκληρωθεί το παιχνίδι και επιστρέφει το χρώμα του νικητή 
//ή - αν δεν έχει ολοκληρωθεί
function endOfGame(){
    var content;
    if (me.piece_color == 'B'){
        content = $("#W_square_0").text();
        if (content == "15/B"){
            return 'B';
        }
    }
    else {
        content = $("#B_square_0").text();
        if (content == "15/W"){
            return 'W';
        }
    }
    return '-';
}
//ελέγχει αν η κίνηση στο sn θα οδηγήσει σε αποκλεισμό του αντιπάλου
function isMoveClosable(s,n){
    var count = 0;
    for (var i=0;i<=5;i++){
        count = 0;
        for (var j = n-i; j<n-i+6; j++){
            if (j==n){
                count++;
            }
            else {
                var str = "";
                if (j>13){
                    var jj = 12-(j-12)+1;
                    var ss = (s=='W'?'B':'W');
                    str = "#"+ss+"_square_"+jj;
                }
                else {
                    str = "#"+s+"_square_"+j;
                }
                var content = $(str).text();
                var contentArray = content.split("/");
                if (contentArray[1]==me.piece_color){
                    count++;
                }
            }
        }
        if (count == 6){
            return true;
        }
    }
    return false;
}
//ελέγχει αν ο παίκτης είναι ελεύθερος να παίζει και δεύτερο πούλι
function isFree(){
    var str = "";
    var contentArray;
    if (me.isfree == "0"){
        if (me.piece_color == 'B'){
            for (var i=12;i>=1;i--){
                str = "#W_square_"+i;
                var content = $(str).text();
                contentArray = content.split("/");
                if (contentArray[1]==='B'){
                    me.isfree = "1";
                    return 1;
                }
            }
            return 0;
        }
        else if (me.piece_color === 'W'){
            for (var i=12;i>=1;i--){
                str = "#B_square_"+i;
                var content = $(str).text();
                
                contentArray = content.split("/");
                console.log(str+" "+contentArray[0]+"/"+contentArray[1]);
                if (contentArray[1] ==='W'){
                    me.isfree = "1";
                    return 1;
                }
            }
            return 0;
        }
    }
    else {
        return 1;
    }
}
//εκτελεί μία ζαριά
function zaria() {
	okMoves[0] = 0;
	okMoves[1] = 0;
	okMoves[2] = 0;
	okMoves[3] = 0;
    $("#zari1").text("");
    $("#zari2").text("");
    $("#zari3").text("");
    $("#zari4").text("");
    
    zari1 = Math.floor(Math.random() * Math.floor(1000));
    zari2 = Math.floor(Math.random() * Math.floor(1000));
    zari1 = zari1 % 6 + 1;
    zari2 = zari2 % 6 + 1;
	
    $("#zari1").text(zari1);
    $("#zari2").text(zari2);
	$("#zari1").show();
    $("#zari2").show();
    $(".from").show();
    $(".to").show();
    
    $("#sideFrom1").show();
    $("#numberFrom1").show();
    $("#sideTo1").show();
    $("#numberTo1").show();

    $("#sideFrom2").show();
    $("#numberFrom2").show();
    $("#sideTo2").show();
    $("#numberTo2").show();
	//αν έχουμε διπλοζαριά
    if (zari1 == zari2) {
        $("#zari3").text(zari1);
        $("#zari4").text(zari1);
		$("#zari3").show();
        $("#zari4").show();
        $("#sideFrom3").show();
        $("#numberFrom3").show();
        $("#sideTo3").show();
        $("#numberTo3").show();
        
        
        $("#sideFrom4").show();
        $("#numberFrom4").show();
        $("#sideTo4").show();
        $("#numberTo4").show();

    }
    else{
		$("#zari3").hide();
        $("#zari4").hide();
        $("#sideFrom3").hide();
        $("#numberFrom3").hide();
        $("#sideTo3").hide();
        $("#numberTo3").hide();
        
        
        $("#sideFrom4").hide();
        $("#numberFrom4").hide();
        $("#sideTo4").hide();
        $("#numberTo4").hide();
    }

    return
}

function draw_empty_board() {
    var t = '<table id="tavli_table">';
	t+="<tr>";
	for (var i = 0; i <= 12; i++) {
		if (i==0){
			t += '<td class="number">ΕΞΩ</td>';
		}
		else {
			t += '<td class="number">'+i+'</td>';
		}
    }
	t+="</tr>";
    t += '<tr>';
    for (var i = 0; i <= 12; i++) {
        t += '<td class="tavli_square" id="B_square_' + i + '"></td>';
    }
    t += '</tr>';
    t += '<tr>';
    for (var i = 0; i <= 12; i++) {
        t += '<td class="square" id="W_square_' + i + '"></td>';
    }
    t += '</tr>';
	t+="<tr>";
	for (var i = 0; i <= 12; i++) {
		if (i==0){
			t += '<td class="number">ΕΞΩ</td>';
		}
		else {
			t += '<td class="number">'+i+'</td>';
		}
    }
	t+="</tr>";
    t += '</table>';

    $('#tavli_board').html(t);
    
}

function fill_board() {
    $.ajax({url: "tavli.php/board/",
        headers: {"X-Token": me.token},
        success: fill_board_by_data});
}

function reset_board() {
    $.ajax({url: "tavli.php/board/", headers: {"X-Token": me.token}, method: 'POST', success: fill_board_by_data});
    $('#move_div').hide();
    $('#game_initializer').show(2000);
}


function fill_board_by_data(data) {
    board = data;
    for (var i = 0; i < data.length; i++) {
        var o = data[i];
        var id = '#' + o.side + '_square_' + o.y;
        $(id).text(o.quantity + "/" + (o.piece_color==null?"-":o.piece_color));
    }
    if (me.piece_color != null && game_status.p_turn == me.piece_color) {
        $('#move_div').show(1000);
    } else {
        $('#move_div').hide(1000);
    }
}

function login_to_game() {
	
    if ($('#username').val() == '') {
        alert('Δεν έχετε καταχωρήσει όνομα');
        return;
    }
    var p_color = $('#pcolor').val();

    draw_empty_board();
    fill_board();
	
    $.ajax({url: "tavli.php/players/" + p_color,
        method: 'PUT',
        dataType: "json",
        headers: {"X-Token": me.token},
        contentType: 'application/json',
        data: JSON.stringify({username: $('#username').val(), piece_color: p_color}),
        success: login_result,
        error: login_error});
}
function login_result(data) {
    me = data[0];
    $('#game_initializer').hide();
    me.isfree = "0";
    $("#game_info").show();
    update_info();
    game_status_update();
}
function login_error(data, y, z, c) {
    var x = data.responseJSON;
    alert(x.errormesg);
}
function game_status_update() {
    clearTimeout(timer);
    $.ajax({url: "tavli.php/status/", method:"POST",success: update_status, headers: {"X-Token": me.token}});
}
//κλήση στον server για να αλλάξει την τρέχουσα κατάσταση του παιχνιδιού μετά από 
//κίνηση που είναι να γίνει (αν χρειάζεται)
function game_status_update_after_play() {
    clearTimeout(timer);
	var mydata = " { \"new_status\":\"next_play\", \"just_played\":\""+me.piece_color+"\" }";
    $.ajax({url: "tavli.php/status/", method:"PUT",data:mydata,success: update_status, headers: {"X-Token": me.token}});
}
//κλήση στον server για να αλλάξει την τρέχουσα κατάσταση του παιχνιδιού μετά από 
//κίνηση που είναι να γίνει (αν χρειάζεται)
function game_status_update_to_end() {
    clearTimeout(timer);
    var mydata = " { \"new_status\":\""+me.piece_color+"\" }";
    $.ajax({url: "tavli.php/status/", method:"PUT",data:mydata, success: update_status, headers: {"X-Token": me.token}});
}
//κλήση στον server για να αλλάξει την τρέχουσα κατάσταση του παιχνιδιού σε ολοκληρωμένο μετά από 
//κίνηση 
function game_status_update_to_null() {
    clearTimeout(timer);
    var mydata = " { \"new_status\":\"_null\" }";
    $.ajax({url: "tavli.php/status/", method:"PUT",data:mydata, success: update_status, headers: {"X-Token": me.token}});
}
//λαμβάνει την κατάσταση του παιχνιδιού από τον server και ελέγχει αν υπήρξαν αλλαγές
//

function update_status(data) {
    last_update = new Date().getTime();
    var game_stat_old = game_status;
    game_status = data[0];
    update_info();
    clearTimeout(timer);
	
    if (game_status.status== 'ended'){
        if (game_status.p_turn == me.piece_color){
            alert("κερδισες");
        }
        else {
            alert("έχασες");
            game_status_update_to_null();
        }
    }
	
    else if (game_status.p_turn == me.piece_color && me.piece_color != null) {
        x = 0;
        // do play
        if (game_stat_old.p_turn != game_status.p_turn) {
            fill_board();
        }
        $('#move_div').show(1000);
        timer = setTimeout(function () {
            game_status_update();
        }, 15000);
    } else {
        // must wait for something
        $('#move_div').hide(1000);
        timer = setTimeout(function () {
            game_status_update();
        }, 4000);
    }

}

function update_info() {
    $('#game_info').html("Είμαι ο παίκτης: " + me.piece_color + ". Το ονομά μου είναι " + me.username + ' με αναγνωριστικό:' + me.token + '<br>Η τρέχουσα κατάσταση του παιχνιδιού είναι: ' + (game_status.status=='undefined'?'ΑΚΑΘΟΡΙΣΤΗ':game_status.status) + ', και τώρα παίζει ο:'+ (game_status.p_turn!=null?game_status.p_turn:'ΚΑΝΕΝΑΣ'));


}
//βρίσκει την απόσταση μεταξύ των θέσεων sf-nf / st-nt
function positionsDistance(sf, nf, st, nt) {
    if (sf == st) {
        console.log(nt - nf);
        return nt - nf;
    } else {
        console.log((12 - nf) + (12 - nt) + 1);
        return (12 - nf) + (12 - nt) + 1;
    }
}
//επιστρέφει το χρώμα των στοιχείων που είναι στην θέση s,n ή - αν είναι άδεια
function getPositionCurrentColor(s, n) {
    var str = "#" + s + "_square_" + n;
    var content = $(str).text();
    var splitContents = content.split("\/");
    return splitContents[1].trim();
}
//αυξάνει το πλήθος των στοιχείων στην θέση s,n κατά 1
//ns είναι το χρώμα που θα πρέπει να έχει το στοιχείο.
function increasePositionContent(s, n, ns) {
    var str = "#" + s + "_square_" + n;
    var content = $(str).text();
    var splitContents = content.split("\/");
    var number = parseInt(splitContents[0].trim());
    var newContent = (number + 1) + "\/" + ns;
    $(str).text(newContent)
}
//μειώνει το πλήθος των στοιχείων στην θέση s,n κατά 1
//ns είναι το χρώμα που θα πρέπει να έχει το στοιχείο.
function decreasePositionContent(s, n, ns) {
    var str = "#" + s + "_square_" + n;
    var content = $(str).text();
    var splitContents = content.split("\/");
    var number = parseInt(splitContents[0].trim());
    if ((number -1)==0){
        ns = "-";
    }
    var newContent = (number - 1) + "\/" + ns;
    $(str).text(newContent)
}
function checkIfValidMovesExist(z1){
	var sum = 0;
	var str_t;
	//white board
	for (i=0;i<=12;i++){
		var str = "#W_square_"+i;
		f_content = $(str).text();
		f_content_array = f_content.split("/");
		f_color = f_content_array[1];
		//αν υπάρχει πούλι στην τρέχουσα θέση
		if (me.piece_color == f_color){
			//ελεγχος για το ζαρι 
			if (me.color == 'W'){
				t_number = i+z1;
			}
			else {
				t_number = i=z1;
			}
			//αν ξεπερνάει το 12
			if (t_number > 12){
				t_number = 12 - (t_number - 12) + 1;
				t_side = 'B';
				str_t = "#B_square_"+t_number;
				t_content = $(str_t).text();
				t_content_array = t_content.split("/");
				t_color = t_content_array[1];
				if ((t_color == me.piece_color) || (t_color=='-')){
					return true;
					break;
				}
			}
			else if (t_number <= 0){
				if (me.color!="W"){
					return true;
				}
			}
			else{
				str_t = "#W_square_"+t_number;
				t_content = $(str_t).text();
				t_content_array = t_content.split("/");
				t_color = t_content_array[1];
				if ((t_color == me.piece_color) || (t_color=='-')){
					return true;
				}
			}
		}
		else {
			continue;
		}
	}
	//black board
	for (i=0;i<=12;i++){
		var str = "#B_square_"+i;
		f_content = $(str).text();
		f_content_array = f_content.split("/");
		f_color = f_content_array[1];
		//αν υπάρχει πούλι στην τρέχουσα θέση
		if (me.piece_color == f_color){
			//ελεγχος για το ζαρι
			if (me.color == 'B'){
				t_number = i+z1;
			}
			else {
				t_number = i=z1;
			}
			//αν ξεπερνάει το 12
			if (t_number > 12){
				t_number = 12 - (t_number - 12) + 1;
				t_side = 'W';
				str_t = "#W_square_"+t_number;
				t_content = $(str_t).text();
				t_content_array = t_content.split("/");
				t_color = t_content_array[1];
				if ((t_color == me.piece_color) || (t_color=='-')){
					return true;
				}
			}
			else if (t_number <= 0){
				if (me.color!="B"){
					return true;
				}
			}
			else{
				str_t = "#B_square_"+t_number;
				t_content = $(str_t).text();
				t_content_array = t_content.split("/");
				t_color = t_content_array[1];
				if ((t_color == me.piece_color) || (t_color=='-')){
					return true;
				}
			}
		}
		else {
			continue;
		}
	}
	return false;
}

//ελέγχει αν είναι έγκυρη η κίνηση για το ζάρι x
function go_move(x) {
	if (checkIfValidMovesExist(x)==false){
		alert("Δεν μπορεί να γίνει κίνηση με αυτή την ζαριά");
		return false;
	}
    var sf = $("#sideFrom"+x).val();
    var st = $("#sideTo"+x).val();
    var nf = $("#numberFrom"+x).val();
    var nt = $("#numberTo"+x).val();
    var zar = $("#zari"+x).text();
    var starting = $("#"+me.piece_color+"_square_0").text();
    if (isFree()==0 && nf==0 && starting!=="15/"+me.piece_color){
        alert("Εσφαλμένη κίνηση: Δεν υπάρχει πίονι στην περιοχή του αντιπάλου");
        return false;
    }
    
    if (isMoveClosable(st,nt)==true){
        alert("Εσφαλμένη κίνηση: Η κίνηση αυτή αποκλείει τον αντίπαλο");
        return false;
    }
    
    if (positionsDistance(sf, nf, st, nt) === parseInt(zar)) {
        if ((getPositionCurrentColor(sf, nf) === me.piece_color) && ((getPositionCurrentColor(st, nt) == me.piece_color) || (getPositionCurrentColor(st, nt) == "-"))) {
            okMoves[x-1] = 1;
            decreasePositionContent(sf, nf, sf);
            increasePositionContent(st, nt, sf);
            if (endOfGame==me.piece_color){
                alert("Κέρδισες");
            }
            return true;
        }  
        else {
            alert("Εσφαλμένη κίνηση: Ο προορισμός δεν είναι έγκυρος");
            return false;
        }
    }
    else {
        alert("Εσφαλμένη κίνηση: Ο προορισμός δεν προσεγγίζεται με αυτήν την ζαριά");
        return false;
    } 
}
//στέλνει την κίνηση στον server και ενημερώνει το ταμπλό στην διεπαφή
 function sendMove(){
		var _okMoves = 0;
		var conf;
		for (i=0;i<4;i++){
			_okMoves+=okMoves[i];
		}
		//δεν έχουν παιχτεί όλα τα ζάρια
        if (!(((_okMoves == 2)&&(zari1 != zari2)) || ((_okMoves == 4)&&(zari1 == zari2)))){
			//ο χρήστης επιβεβαιωνει ότι θα στείλει τις κινήσεις του.
            conf = confirm("Ελέγξτε τις κινήσεις σας. Είναι ολοκληρωμένες;");
			if (conf == false){
				return false;
			}
        }
        var sf1 = $("#sideFrom1").val();
        var sf2 = $("#sideFrom2").val();
        var sf3 = $("#sideFrom3").val();
        var sf4 = $("#sideFrom4").val();

        var st1 = $("#sideTo1").val();
        var st2 = $("#sideTo2").val();
        var st3 = $("#sideTo3").val();
        var st4 = $("#sideTo4").val();

        var nf1 = $("#numberFrom1").val();
        var nf2 = $("#numberFrom2").val();
        var nf3 = $("#numberFrom3").val();
        var nf4 = $("#numberFrom4").val();

        var nt1 = $("#numberTo1").val();
        var nt2 = $("#numberTo2").val();
        var nt3 = $("#numberTo3").val();
        var nt4 = $("#numberTo4").val();
        var z1 = $("#zari1").text();
        var z2 = $("#zari2").text();
        var z3 = $("#zari3").text();
        var z4 = $("#zari4").text();
        if (z1 != z2){//δεν έχουμε διπλοζαριά
           sf3 = "-";
           sf4 = "-";
           st3 = "-";
           st4 = "-";
           nf3 = "-1";
           nf4 = "-1";
           nt3 = "-1";
           nt4 = "-1";
        }
    var parameters = " [ ";
    parameters += " { \"token\" : \""+me.token+"\", \"piece_color\" : \""+me.piece_color+"\"} ,";
	if (okMoves[0]==1){
		parameters += " { \"from\" : \""+sf1+nf1+"\", \"to\":\""+st1+nt1+"\" }, ";
	}
	else {
		parameters += " { \"from\" : \"-\", \"to\":\"-\" }, ";
	}
	if (okMoves[1]==1){
		parameters += " { \"from\" : \""+sf2+nf2+"\", \"to\":\""+st2+nt2+"\" }, ";
		}
	else {
		parameters += " { \"from\" : \"-\", \"to\":\"-\" }, ";
	}
	if (okMoves[2]==1){
		parameters += " { \"from\" : \""+sf3+nf3+"\", \"to\":\""+st3+nt3+"\" }, ";
		}
	else {
		parameters += " { \"from\" : \"-\", \"to\":\"-\" }, ";
	}
	if (okMoves[3]==1){
		parameters += " { \"from\" : \""+sf4+nf4+"\", \"to\":\""+st4+nt4+"\" } ";
		}
	else {
		parameters += " { \"from\" : \"-\", \"to\":\"-\" } ";
	}
    parameters += " ] ";
	//αποστολή των κινήσεων στον server
    $.ajax({url: "tavli.php/board/makemove/",
        method: 'PUT',
        dataType: "json",
        contentType: 'application/json',
        data: parameters,
        headers: {"X-Token": me.token},
        success: move_result});
   okMoves = 0;
   return true;
}

function move_result(data) {
    game_status_update_after_play();
    fill_board_by_data(data);
}
//επαναρχικοποιεί το ταμπλό και το παιχνίδι
function tavli_reset(){
    $.ajax({url: "tavli.php/board/",
        method: 'POST',
        dataType: "json",
        //data: JSON.stringify({x: a[2], y: a[3]}),
        headers: {"X-Token": me.token},
        success: move_result});
    }

