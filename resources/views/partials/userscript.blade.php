<script>
$(document).ready(function(){

    function clear_icon(){
        $('#id_icon').html('');
        $('#fname_icon').html('');
        $('#lname_icon').html('');
        $('#hobbies_icon').html('');
    }
    
    function fetch_data(page, sort_type, sort_by, query, pagelength){
        $.ajax({
            url:"/?page="+page+"&sortby="+sort_by+"&sorttype="+sort_type+"&query="+query+"&pagelength="+pagelength,
            success:function(data){
                $('tbody').html('');
                $('tbody').html(data);
            }
        })
    }

    $('body').on('keyup', '#serach', function(){
        var pagelength=$('#pagenationlenth').find(":selected").val();
        var query = $('#serach').val();
        var column_name = $('#hidden_column_name').val();
        var sort_type = $('#hidden_sort_type').val();
        var page = $('#hidden_page').val();
        fetch_data(page, sort_type, column_name, query,pagelength);
    });

    $('#pagenationlenth').on('change',function(){
        var pagelength=$(this).find(":selected").val();
         var query = $('#serach').val();
         var page = $('#hidden_page').val();
         var sort_type = $('#hidden_sort_type').val();
         var column_name = $('#hidden_column_name').val();
         fetch_data(page, sort_type, column_name, query,pagelength);
    });

    $('body').on('click', '.sorting', function(){
        var column_name = $(this).data('column_name');
        var order_type = $(this).data('sorting_type');
        var reverse_order = '';
        if(order_type == 'asc'){
            $(this).data('sorting_type', 'desc');
            reverse_order = 'desc';
            clear_icon();
            $('#'+column_name+'_icon').html('<span class="glyphicon glyphicon-triangle-bottom"></span>');
        }
        if(order_type == 'desc'){
            $(this).data('sorting_type', 'asc');
            reverse_order = 'asc';
            clear_icon
            $('#'+column_name+'_icon').html('<span class="glyphicon glyphicon-triangle-top"></span>');
        }
        $('#hidden_column_name').val(column_name);
        $('#hidden_sort_type').val(reverse_order);
        var page = $('#hidden_page').val();
        var query = $('#serach').val();
        var pagelength=$('#pagenationlenth').find(":selected").val();
        fetch_data(page, reverse_order, column_name, query,pagelength);

    });

    $('body').on('click', '.pager a', function(event){
        event.preventDefault();
        var page = $(this).attr('href').split('page=')[1];
        $('#hidden_page').val(page);
        var column_name = $('#hidden_column_name').val();
        var sort_type = $('#hidden_sort_type').val();
        var query = $('#serach').val();
        $('li').removeClass('active');
        $(this).parent().addClass('active');
        var pagelength=$('#pagenationlenth').find(":selected").val();
        fetch_data(page, sort_type, column_name, query,pagelength);
    });
});
</script>
