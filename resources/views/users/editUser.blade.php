@extends('layouts.master')

@section('content')
<br>
<div class="row">
<div class="col-md-offset-3 col-md-6 col-md-offset-3 col-sm-offset-3 col-sm-6 col-sm-offset-3 col-xs-12">

@if ($errors->any())
    <div class="alert alert-danger">
        <ul>
            @foreach ($errors->all() as $error)
                <li>{{ $error }}</li>
            @endforeach
        </ul>
    </div>
@endif

@foreach($users as $user)
<form action="{{ url('/updateUser/'. $user->id)  }}" method="post" >
{{csrf_field()}}

<div class="form-group">
<label>First Name:</label>
<input type="text" value="{{$user->fname}}" name="first_name" class="form-control">
</div>
<br>
<div class="form-group">
<label> 
Last Name:</label> 
<input type="text" value="{{$user->lname}}" name="last_name" class="form-control">
</div>
<br>
<?php $hobbie_ids=explode(',',$user->hobbieids); ?>
<div class="form-group">
<label>
Hobbies:</label>
<br>
@foreach ($hobbies as $hob)
<input type="checkbox" <?php if(in_array($hob->id, $hobbie_ids)){ echo " checked=\"checked\""; } ?>   id="hobbies" name="hobbies[]" value="{{ $hob->id }}">
<label > {{ $hob->hobbie_name }} </label><br>
  
@endforeach
  <br>
</div>

@endforeach
<button type="submit"  class="btn btn-primary mt-2"value="Submit">Submit</button>
</form>
</div>
</div>
@endsection