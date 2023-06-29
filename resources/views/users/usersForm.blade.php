@extends('layouts.master')
 
@section('content')
<br>
<div class="row">
<div class="col-md-offset-3 col-md-6 col-md-offset-3 col-sm-offset-3 col-sm-6 col-sm-offset-3 col-xs-12">	
<form action="{{ url('/addUser/')  }}" method="post" >
{{csrf_field()}}

@if ($errors->any())
    <div class="alert alert-danger">
        <ul>
            @foreach ($errors->all() as $error)
                <li>{{ $error }}</li>
            @endforeach
        </ul>
    </div>
@endif

<div class="form-group">
<label>First Name:</label>
<input type="text"  name="first_name" class="form-control">
</div>
<br>
<div class="form-group">
<label> 
Last Name:</label> 
<input type="text"  name="last_name" class="form-control">
</div>
<br>
<div class="form-group">
<label>
Hobbies:</label>
<br>
@foreach ($hobbies as $hob)
<input type="checkbox" id="hobbies" name="hobbies[]" value="{{ $hob->id }}">
  <label > {{ $hob->hobbie_name }} </label><br>
  
  @endforeach
  <br>
</div>

<button type="submit"  class="btn btn-primary mt-2"value="Submit">Submit</button>
</form>
</div>
</div>
@endsection