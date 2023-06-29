<?php
namespace App\Http\Controllers;

use App\Models\User;
use App\Models\User_hobbies;
use App\Models\Hobbies;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class UserController extends Controller
{
    public function allUsers(Request $request)
    {        
        $users=User_hobbies::join('Users','User_hobbies.user_id','=','Users.id')
                            ->join('Hobbies','Hobbies.id','=','User_hobbies.hobbie_id')
                            ->groupBy('Users.id')
                            ->select('Users.id as id','Users.first_name as fname','Users.last_name as lname')
                            ->selectRaw('GROUP_CONCAT(Hobbies.hobbie_name) as hobbiename')
                            ->paginate(5);
        if($request->ajax()){
            DB::enableQueryLog();
            $sort_by = $request->get('sortby');
            $sort_type = $request->get('sorttype');
            $query = $request->get('query');
            $query = str_replace(" ", "%", $query);
            $paginationnumber=$request->get('pagelength');
            $users = User_hobbies::join('Users','User_hobbies.user_id','=','Users.id')
                            ->join('Hobbies','Hobbies.id','=','User_hobbies.hobbie_id')
                            ->groupBy('Users.id')
                            ->select('Users.id as id','Users.first_name as fname','Users.last_name as lname')
                            ->selectRaw('GROUP_CONCAT(Hobbies.hobbie_name) as hobbiename')
                            ->having('id', 'like', '%'.$query.'%')
                            ->orHaving('fname', 'like', '%'.$query.'%')
                            ->orHaving('lname', 'like', '%'.$query.'%')
                            ->orHaving('hobbiename', 'like', '%'.$query.'%')
                            ->orderBy($sort_by, $sort_type)
                            ->paginate($paginationnumber);
                            /*$querydata = DB::getQueryLog();
                            $querydata = end($querydata);
                            dd($querydata);*/
            return view('users.pagination_child', compact('users'))->render();
        }
        return view('users.usersList',compact('users'));
    } 

    public function createUser()
    {
        $hobbies=Hobbies::All();
        return view('users.usersForm',compact('hobbies'));
    }

    public function addUser(Request $request)
    {
        $validated = $request->validate([
        'first_name' => 'required',
        'last_name' => 'required',
        'hobbies' => 'required'
        ]);

        if($validated)
        {
            $user=new User;
            $hobbiesdata=array();
            $hobbiesdata=$request->input('hobbies');
            $user->first_name=$request->input('first_name');
            $user->last_name=$request->input('last_name');
            $user->save();
            $userid=$user->id;
            foreach($hobbiesdata as $value)
            {
                $user_hobby=new user_hobbies;
                $user_hobby->user_id=$userid;
                $user_hobby->hobbie_id=$value;
                $user_hobby->save();
            }
            return redirect('/')->with('message',"Create User Successfully");
        }
        else
        {
            return redirect('/createUser');
        }
    }

    public function editUser($id)
    {
        $users=User_hobbies::join('Users','User_hobbies.user_id','=','Users.id')
                            ->join('Hobbies','Hobbies.id','=','User_hobbies.hobbie_id')
                            ->groupBy('Users.id')
                            ->select('Users.id as id','Users.first_name as fname','Users.last_name as lname')
                            ->selectRaw('GROUP_CONCAT(Hobbies.id) as hobbieids')
                            ->having('id',$id)->get();
        $hobbies=Hobbies::All();
        return view('users.editUser', compact('users','hobbies'));
    }

    public function updateUser(Request $request, $id)
    {
         $validated = $request->validate([
        'first_name' => 'required',
        'last_name' => 'required',
        'hobbies' => 'required'
        ]);

        if($validated)
        {
            $hobbiesdata=array();
            $hobbiesdata=$request->input('hobbies');
            $user=User::findOrFail($id);
            $user->first_name=$request->input('first_name');
            $user->last_name=$request->input('last_name');
            $user->save();
            $user_hobbi=user_hobbies::where('user_id',$id);
            $user_hobbi->delete();
            foreach($hobbiesdata as $value)
            {
                $user_hobby=new user_hobbies;
                $user_hobby->user_id=$id;
                $user_hobby->hobbie_id=$value;
                $user_hobby->save();
            }
            return redirect('/')->with('message',"Update User  Successfully");
        }
        else
        {
            return redirect('/editUser');
        }
    }

    public function deleteUser($id)
    {
        $user=User::where('id',$id)->delete();
        $user_hobbi=user_hobbies::where('user_id',$id);
        $user_hobbi->delete();
        return redirect('/')->with('message',"Delete User Successfully");
    }

}
