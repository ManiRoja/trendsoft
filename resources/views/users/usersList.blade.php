@extends('layouts.master')
 
@section('content')
  @if(session()->has('message'))
    <div class="alert alert-success">
        {{ session()->get('message') }}
    </div>
@endif

   <div class="row">
     <div class="col-md-6"></div>
     <div class="col-md-6" align="right">
        <a class="btn btn-primary" href="{{ url('/createUser') }}">Creat</a>
     </div>
    </div><br>
   <div class="row">
    <div class="col-md-6">
        <label>Show 
            <select name="pagination_length" id="pagenationlenth" class="input-sm">
                <option value="5">5</option>
                <option value="10">10</option>
                <option value="50">50</option>
                <option value="100">100</option>
            </select> 
        entries</label>
    </div>
    <div class="col-md-3">

    </div>
    <div class="col-md-3">
     <div class="form-group">
       <label for="serach" class="col-sm-3 control-label">Search</label>
       <div class="col-sm-9">
        <input type="text" name="serach" id="serach" class="form-control" />
       </div>
     </div>
    </div>
   </div><br>
   <div class="table-responsive">
    <table class="table table-striped table-bordered">
     <thead>
      <tr>
       <th width="5%" class="sorting" data-sorting_type="asc" data-column_name="id" style="cursor: pointer">ID <span id="id_icon"></span></th>
       <th width="19%" class="sorting" data-sorting_type="asc" data-column_name="fname" style="cursor: pointer">First name <span id="fname_icon"></span></th>
       <th width="19%" class="sorting" data-sorting_type="asc" data-column_name="lname" style="cursor: pointer">Last name <span id="lname_icon"></span></th>
       <th width="47%" class="sorting" data-sorting_type="asc" data-column_name="hobbiename" style="cursor: pointer">Hobbies <span id="hobbies_icon"></span></th>
       <th width="10%">Actions</th>
      </tr>
     </thead>
     <tbody>
      @include('users.pagination_child')
     </tbody>
    </table>
    <input type="hidden" name="hidden_page" id="hidden_page" value="1" />
    <input type="hidden" name="hidden_column_name" id="hidden_column_name" value="id" />
    <input type="hidden" name="hidden_sort_type" id="hidden_sort_type" value="asc" />
   </div>
@endsection
