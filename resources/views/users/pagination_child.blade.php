@foreach($users as $row)
<tr>
    <td>{{ $row->id}}</td>
    <td>{{ $row->fname }}</td>
    <td>{{ $row->lname }}</td>
    <td>{{ $row->hobbiename }}</td>
    <td><a class="urlredirect" href="{{ url('/editUser/'. $row->id) }}">Edit</a>  <a class="urlredirect" href="{{ url('/deleteUser/'. $row->id) }}">Delete</a></td>
</tr>
@endforeach
<tr>
    <td colspan="6" align="center">
        {!! $users->links('pagination.custom') !!}
    </td>
</tr>