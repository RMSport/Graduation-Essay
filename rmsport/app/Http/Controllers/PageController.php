<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

use App\Http\Requests;

use App\Models\User;
use App\Models\Product;

use Session;
use DB;
use Auth;
use Hash;


class PageController extends Controller
{
    public function getIndex(){
        return view('home-02');
    }

    protected function guard($name)
    {
        return Auth::guard('$name');
    }
    public function getLogin(){
        return view('login');
    }
    public function postLogin(Request $req) {
        $this->validate($req, 
            [
                'email' => 'required|email',
                'password' => 'required|min:6'
            ],
            [
                'email.required' => 'Vui lòng nhập email.',
                'email.email' => 'Không đúng định dạng email.',
                'password.required' => 'Vui lòng nhập mật khẩu.',
                'password.min' => 'Mật khẩu phải ít nhất 6 ký tự.'
            ]
        );
        $credentials = array('email' => $req->email, 'password' => $req->password);
        if(Auth::guard('user')->attempt($credentials)) {
           return redirect()->route('home-02');
        }
        else {
            return redirect()->back()->with(['flag'=>'danger', 'message'=>'Wrong username or password']);
        }
    }
    public function getRegister() {
        return view('register');
    }
    public function postRegister(Request $req) {
        $this->validate($req,
            [
                'email' => 'required|email|unique:users,email',
                'pass' => 'required|min:6',
                'repass' => 'required|same:pass'
            ],
            [
                'email.email' => 'Không đúng định dạng email.',
                'email.unique' => 'Email đã có người sử dụng.',
                'pass.min' => 'Mật khẩu phải ít nhất 6 ký tự.',
                'repass.same' => 'Mật khẩu không giống nhau.'
            ]
        );

        $user = new User();
        $user->name = $req->name;
        $user->email = $req->email;
        $user->password = Hash::make($req->pass);
        $user->save();
        return redirect()->back()->with('thanhcong', 'Created account!');
    }
    public function getSearch(Request $req) {
        $sanpham = Product::where('name','like','%'.$req->search.'%')->get();
        return view('search', compact('sanpham'));
    }
}
