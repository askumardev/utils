
purchase order bug-> qty_received is greater than product_qty when the same product is selected 
in purchase order lines.-->fixed in smerp 5 modules and need to change in bhuvaneswar.

remove taxes links are hided if the invoice is not in draft state. i.e., if the invoice is 
validated direct account invoice,from purchase order, in customer invoices.
============================================================================================
truncate table accounting_account_invoice_lines restart identity;
truncate table accounting_account_invoices restart identity;
truncate table purchase_purchase_order_lines restart identity;
truncate table purchase_purchase_orders restart identity;
truncate table stock_pickings restart identity;
truncate table stock_moves restart identity;
truncate table accounting_account_tax_pol_rels restart identity;
============================================================================================
dev:
truncate table purchase_purchase_order_lines restart identity;
truncate table purchase_purchase_orders restart identity;
truncate table accounting_account_tax_pol_rels restart identity;
truncate table purchase_vendor_pos restart identity;
truncate table accounting_account_invoice_lines restart identity;
truncate table accounting_account_invoices restart identity;
truncate table accounting_invoice_line_taxes restart identity;
truncate table accounting_account_moves restart identity;
truncate table accounting_account_move_lines restart identity;
truncate table stock_pickings restart identity;
truncate table stock_moves restart identity;
============================================================================================
afzal for pos,sos,direct cust and invs:
.......................................
truncate table accounting_account_invoice_accout_move_line_rels,accounting_account_invoice_lines,
accounting_account_invoice_taxes, accounting_account_invoices, accounting_account_moves,
accounting_account_move_lines, accounting_account_payments, accounting_account_tax_pol_rels,
accounting_invoice_line_taxes, purchase_purchase_order_lines, purchase_purchase_orders,
sale_sale_order_line_accounting_tax_pol_rels, sale_sale_order_lines, sale_sale_orders,stock_moves,
stock_pickings restart identity;
---------------------------------------------------------------------------------
Desktop>SMERP_Saudhi>09.04.18>smerp_dev is the client running project which is not having cancan

home>smerp_dev is the development for 5 modules having cancan

Desktop>Bhuvaneswar_Dev>SMERP_BBS is the bhuvaneswar project
---------------------------------------------------------------------------------
Q) The single-table inheritance mechanism failed to locate the subclass: 'Register Payment'. 
This error is raised because the column 'type' is reserved for storing the class in case of inheritance. 
  Please rename this column if you didn't intend it to be used for storing the inheritance class or 
  overwrite Accounting::AccountInvoice.inheritance_column to use another column for that information.
ans:- just remove the data("Register Payment") inserted in the type field in the acc invoices.

Q) customer invoices-register payment-sending the value in the hidden field along with <a> link button
ans:-  <a href="#" class="btn btn-primary" onclick="submitcustomerinvoiceformDirect();">Register Payment</a>
    <%#= f.hidden_field :state, :value=>'Register Payment'%>---->wrong way
    <%= hidden_field_tag :state, "Register Payment" %>---->correct way

we can do type,value in f.submit button, it will not work in this situaion, but will work on other cases
<%#= f.submit  'Register Payment' , name: "type",value: "Register Payment",:class=>"btn btn-primary", 
onclick: 'submitcustomerinvoiceformDirect();'%>
************************************************************************************************************
Q) to display data in the edit page directly and which cant be edited
<div class="col-xs-4">
  <% if params[:action]== "edit" %>
    <%= f.object.method %>**
  <% else %>
    <%= f.radio_button :method,'Linear' %>Linear
    <br>
    <%= f.radio_button :method,'Degressive'%>Degressive
  <% end %>                 
</div>

************************************************************************************************************
Q) method for pagination,write the method name after authenticate user in the application controller.

def set_pagination
  if params[:page].nil?
    @page=1
  else
    @page = params[:page]
  end
end

*************************************************************************************************************
Q) set background image for a table
.tkt_view{
  /*background-image: url(../../assets/login-bg.jpg);*/->from app/assets/images folder
  background-image: url(/assets/emailheader.png);->from public/assets folder
}

Q)Showing Image Attachments
<strong>Attachments:</strong>
<%@attachments.each do |attachment|%>
<%= link_to image_tag(attachment.image.url(:thumb), class: 'media-object'), attachment.image.url, target: '_blank' if attachment.id %>
<%end%>

Q) to download Image attachments
<%@attachments.each do |attachment|%>         
  <%= link_to attachment.image(:original), download: "#{attachment.id}_#{attachment.image_file_name}" do%><br>         
    <%=attachment.image_file_name%>
  <%end%>
<%end%>

Q) collection select in a show page
remove multiple: true if we want collection select, otherwise it will have an option to select multiple
 <%= select_tag :user_id,options_for_select(@l1users.collect{ |u| [User.find(u.user_id).name, u.user_id] }), {:include_blank => 'Select',multiple: true, class: "form-control"}  %>

Q) to expire the session after some time, write this in config/initializers/session_store.rb
Rails.application.config.session_store :cookie_store, key: '_Example_session', expire_after: 15.minutes

Q) Will Paginate Gem Documentation
1) Copy the gem 'will_paginate', '~> 3.1.0' onto Gem file
2) Run Bundle install
3) Go to the required index action of the respected controller and write 
	.paginate(page: params[:page], per_page: 10)
   ex: @designations = Designation.all.order('id desc').paginate(page: params[:page], per_page: 10)
4) Write this in the view(index.html.erb)
   <%= will_paginate @designations %>

Q) Dropdown menu user profile linking--we are adding html_safe to render using link_to
<li><%=link_to ('<i class="fa fa-user" aria-hidden="true"></i> My Profile').html_safe,my_profile_path%></li>

Q) Index Page Records filtering using jquery
https://m.patrikonrails.com/how-to-make-ajax-calls-the-rails-way-20174715d176
 <%#=select("post", "person_id", Company.all.collect {|p| [ p.name, p.id ] }, { include_blank: true })%>

<%=select("active", "result_id", results.collect {|p| [ p.first, p.last ] })%>-->it works in index page filtering records

<%#= select_tag :assigned_to,options_for_select(results), {:include_blank => 'Select'}  %>

<%#= check_box_tag 'show all',true,false,data: { url: inactive_companies_companies_path, remote: true }, style: 'margin-top:2%;'%>

// $('#status_result_id').on('change',function(){
//   var status_result = $('#status_result_id').val();
//   if(status_result == 'active'){
//     window.location.href = '/statuses'
//   }
//   else if(status_result == 'in active'){
//     window.location.href = '/statuses/inactive_list'
//   }
// });

var stat_result = $('#status_result_id').val();
if(stat_result=='active'){
$('.active_status_data').show();
$('.inactive_status_data').hide();
}
else if(stat_result=='in active'){
$('.active_status_data').hide();
$('.inactive_status_data').show();
}

if(window.location.href.indexOf("false") > -1) {
  $('.inactive_status_data').show();
  $('.active_status_data').hide();
  $('#status_result_id').val('in active');
}
if(window.location.href.indexOf("true") > -1) {
  $('.inactive_status_data').hide();
  $('.active_status_data').show();
  $('#status_result_id').val('active');
}

$('#status_result_id').on('change',function(){

var status_result = $('#status_result_id').val();
if(status_result=='active'){
  if(window.location.href.indexOf("false") > -1) {     
    // $('#status_result_id').val('active');
    // $('.inactive_status_data').show();
    // $('.active_status_data').hide();
    window.location.href = '/statuses'
     // alert('in href false');
  }
  else{
    $('.active_status_data').show();
    $('.inactive_status_data').hide();
   // alert('on change active');
  }
}
else if(status_result=='in active'){
  if(window.location.href.indexOf("true") > -1) {
     // $('#status_result_id').val('in active');
     // $('.inactive_status_data').hide();
     // $('.active_status_data').show();
     window.location.href = 'statuses?active=false'
     // alert('in href true');
  }
  else{
    $('.active_status_data').hide();
    $('.inactive_status_data').show();
    // alert('on change in active');
  }
}
});
-----------------------------------------------------------------------------------------------------------
Reporting---->SMERP

controller-->here

def sale_or_purchase_preview
  @target_moves = params[:target_moves]
  @entries_sort = params[:entries_sort]
  @start_date = Time.zone.parse(params[:start_date]).utc if params[:start_date]
  @end_date = Time.zone.parse(params[:end_date]).utc if params[:end_date]
  @journals = params[:journals]
  if params[:target_moves] == "All Posted Entries"
  	@invoices_in_date_range = Accounting::AccountInvoice.where('state = ? and invoice_date BETWEEN ? AND ?','Paid',@start_date, @end_date).ids.collect{|i| i.to_s}
  elsif params[:target_moves] == "All Entries"
    @invoices_in_date_range = Accounting::AccountInvoice.where('invoice_date BETWEEN ? AND ?',@start_date, @end_date).ids.collect{|i| i.to_s}
  end
  # @invoices_in_date_range = Accounting::AccountInvoice.where(:invoice_date => @start_date..@end_date).ids.collect{|i| i.to_s}
  # @acc_invoices = Accounting::AccountInvoice.where('invoice_date BETWEEN ? AND ?', @start_date, @end_date)
  # @acc_move_ids = Accounting::AccountMove.where('journal_id in(?)',@journals).ids
  @acc_move_ids = Accounting::AccountMove.where('journal_id = ? and ref in (?)',1,@invoices_in_date_range).ids
  @acc_move_lines = Accounting::AccountMoveLine.where('account_move_id in (?)',@acc_move_ids)
  respond_to do |format|
    format.html
    format.pdf do
      render :pdf => "sale/purchase report"
    end
  end
end
+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
https://medium.com/
Q) Show and Hide the div by using check box
https://www.aspsnippets.com/Articles/Show-Hide-DIV-with-TextBox-when-CheckBox-is-checked-unchecked-using-JavaScript-and-jQuery.aspx
==============================================================================================================
Q) For new installations you should be running rake db:schema:load, not rake db:migrate, 
this will load the schema into the database, which is faster than running all the migrations.
=============================================================================================================
paasing a param from index page
<%= link_to 'Show',inventories_product_path(product.id,type: "product_varient"),class: 'btn btn-warning' %>
==============================================================================================================
if a record is not found, then we can handle the exception as in the application controller,
rescue_from ActiveRecord::RecordNotFound, :with => :render_404

create a method as render_404 as mentioned in :with
then you can render template or redirect to any other action
link: https://stackoverflow.com/questions/32328074/how-to-handle-error-when-id-is-not-found
============================================================================================================
Has and Belongs to Many Association Example:

Users has and belongs to many Branches
has_and_belongs_to_many :branches

Branches has and belongs to many Users
has_and_belongs_to_many :users

created a join table for user_id and branch_id
rails g migration BranchUser

class BranchUser < ActiveRecord::Migration[5.1]
  def change
    create_table :branches_users do |t|
      t.belongs_to :branch, index: true
      t.belongs_to :user, index: true
      t.boolean :is_active, default: true
      t.timestamps
    end
  end
end

in the user form,
<%= f.collection_select :branch_ids,Branch.active,:id,:branch_name,{:include_blank=>"Select"},:multiple=>true,:class=>"form-control rfqtax" %>

in the controller, params as :branch_ids=>[]
def set_user_params
  params.require(:user).permit(:email, :name, :company_id, :language_id, :timezone, :notifications,
    :signature, :password,:role_id, :password_confirmation, :profile_pic, :department_id, :designation_id, :reporting_manager_id,
    user_app_role_attributes: [:id, :user_id, :role_name, :app_id],:branch_ids=>[])
end

for namescoped models
https://stackoverflow.com/questions/32150004/rails-what-do-i-need-to-do-to-create-a-many-to-many-relationship-between-two-mo

we have two models having namespace as accounting

one is,
class Accounting::AccountTax < ApplicationRecord
  has_and_belongs_to_many :group_taxes,:class_name=>'Accounting::GroupTax',:join_table=>'accounting_account_tax_group_taxes', optional: true
end

second one is,
class Accounting::GroupTax < ApplicationRecord
  scope :active, ->{where(is_active: true)}
  has_and_belongs_to_many :account_taxes,:class_name=>'Accounting::AccountTax',:join_table=>'accounting_account_tax_group_taxes', optional: true
end

created a join table like below.
class AccountTaxGroupTax < ActiveRecord::Migration[5.1]
  def change
    create_table :accounting_account_tax_group_taxes do |t|			
      t.integer :account_tax_id
      t.integer :group_tax_id
      t.integer :created_by
      t.integer :modified_by
      t.boolean :is_active, default: true
      t.timestamps
    end
  end
end

and i'm using collection checkboxes for selecting multiple account_taxes for a group tax.
i'm adding in collection checkboxes to form as below.

 <div class="row">
  <div class="col-md-4 col-md-offset-4">
    <div class="panel_checkbox">
      <%= f.collection_check_boxes(:account_tax_ids, Accounting::AccountTax.all, :id, :name, checked: Accounting::AccountTax.all.try(:account_tax_ids)) do |tax|%>
         <div class="checkbox checkbox-success checkbox-circle panel_check">
           <%= tax.check_box %><label><%= tax.text %></label>
         </div>  
      <% end %> 
    </div> 
  </div>
</div>

in my controller, i'm passing params as like below.
params.require(:accounting_group_tax).permit(:id,:name,:amount,:create_by,:modified_by,:is_active,
:account_tax_ids=>[])
============================================================================================
  var form =  $('#formpayment').get(0);
  var formdata = new FormData(form);
  alert (JSON.stringify(formdata)); 
============================================================================================
https://medium.com/react-on-rails
============================================================================================
sk@ubuntu-desktop3:~$ gem list
gem list will list out all the gems that are installed in our system.
============================================================================================
we have migration timestamps at schema migrations.
if we generated a migration and it's not creating a table, then we should have to check out the 
  schema migrations.if any previous migration exists with the same table name then we have to remove 
  the previous timestamp row then run rake db:migrate
============================================================================================
Calling Cocoon Before and After Functions Examples:
In Your View 
Nested Form Below
 <div class="col-md-12 table-responsive"  id="pol_item">
    <fieldset id="recipe-ingredients">
    <% @i=0 %>
     <%= f.fields_for :purchase_order_lines  do |ptl| %>
      <%= render 'purchase_order_line_fields', :f => ptl,:k=>@i%>
      <% @i=@i+1 %>
     <% end %>
     <% if  @po.state !='confirm' %>                   
     <div class="links">
       <%= link_to_add_association 'Add Item', f, :purchase_order_lines,:data => {"association-insertion-method" => "before" },class: "btn btn-success",:id=>"pol_item" %>
     </div>
     <% end %>
   </fieldset>
  </div>

id="pol_item" is the id in the calling doc ready function--><div class="col-md-12 table-responsive"  
id="pol_item">
and you can call in document ready function like this

$(document).ready(function() {
  $('#pol_item').on("cocoon:after-remove", function() {
    getNullAmounts();
  });
});
============================================================================================
<button id="callConfirm">Confirm!</button>

<div id="dialog" title="Confirmation Required">
  Are you sure about this?
</div>
$(function() {
  $("#dialog").dialog({
     autoOpen: false,
     modal: true,
     buttons : {
          "Confirm" : function() {
              alert("You have confirmed!");            
          },
          "Cancel" : function() {
            $(this).dialog("close");
          }
        }
      });
  $("#callConfirm").on("click", function(e) {
      e.preventDefault();
      $("#dialog").dialog("open");
  });
});
============================================================================================
Cassandra DB with Rails
https://medium.com/technically-speaking/rails-4-user-authentication-with-cequel-and-devise-86e1c9ccbcd0
============================================================================================
rejecting nested attributes based on specific field absence
accepts_nested_attributes_for :account_invoice_lines,reject_if: :reject_products, allow_destroy: true
def reject_products(attributes)
  attributes['product_id'].blank?
end
============================================================================================
if we are entering 0010 in a text field,while calculating the amount it will taka octa values instead of decimal.to overcome this
we have to replace the given string as below.

str.replace(/^0+(?!\.|$)/, '')
  '0000.00' --> '0.00'   
     '0.00' --> '0.00'   
  '00123.0' --> '123.0'   
        '0' --> '0'
============================================================================================
<div class="col-xs-3 panel_checkbox">
  <%= f.collection_check_boxes(:user_ids, User.active, :id, :name, checked: User.active.try(:user_ids)) do |user|%>
     <div class="checkbox checkbox-success checkbox-circle panel_check">
       <%= user.check_box %><label><%= user.text %></label>
     </div>  
  <% end %> 
</div> 

<% @acctaxes.each do |tax| %>
 <%= f.check_box :account_tax_ids,{multiple: true,onclick: "checkSum(this);"},tax.id,false%>
 <%= tax.name %><br/>
<% end %> 

resources :group_taxes do
  collection do
    get 'get_amount',to: "group_taxes#get_amount"
  end
end

def get_amount
  amount = 0.0
  if params[:taxids].present? 
    params[:taxids].each do |id|
      amount += Accounting::AccountTax.find(id).amount
    end
  end
  render json:amount.to_json
end
==============================================================================================
https://stackoverflow.com/questions/2155622/get-a-list-of-checked-checkboxes-in-a-div-using-jquery
http://jsfiddle.net/dvCmR/

function checkSum(obj){ 
  //sk-->getting the values of selected checkboxes
  var selected = $("#panel_checkbox input:checked").map(function(i,el){return el.value;}).get();    
  var taxdata = {"taxids":selected}
  $.ajax({
    type: "GET",
    url: '/accounting/group_taxes/get_amount',
    data: taxdata,
    dataType: "JSON",
    success:function(result){ 
      $('#accounting_group_tax_amount').val(result);
    }

  });
}
============================================================================================
1) Create table product_categories_bkp_06062018 as
select * from product_categories

2) INSERT INTO product_categories
SELECT * FROM product_categories_bkp_06062018;
============================================================================================
we can change the order of insertion of cocoon nested fields by the given way.

$(document).ready(function() {
  $("#owner a.add_fields").
    data("association-insertion-method", 'before').
    data("association-insertion-node", 'this');
});

in smerp,
  $("#acinvl_item a.add_fields").
  data("association-insertion-method", 'before').
  data("association-insertion-node", 'this');
============================================================================================
setting the value of a dropdown using index number
var hidden_product = $('#manufacturing_production_hidden_product_id').val();
$("select#manufacturing_production_product_id")[0].selectedIndex = hidden_product;
============================================================================================
Modal Pop Up Cannot be hided if we click on outside pop up or if we pressed the 'ESC'
$('#accpaymentmodalinvoice').modal({backdrop: 'static', keyboard: false}) 
============================================================================================
Scopes that are written inside model are also accesible in the helpers.
============================================================================================
