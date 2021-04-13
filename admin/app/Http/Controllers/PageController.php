<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

use App\Http\Requests;


use App\Models\NhanVien;

use Session;
use DB;
use Auth;
use Hash;

class PageController extends Controller
{
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
        if(Auth::guard('nhanvien')->attempt($credentials)) {
            return redirect()->route('index');
        }
        else {
            return redirect()->back()->with(['flag'=>'danger', 'message'=>'Wrong username or password']);
        }
    }

    public function getLogout(Request $req) {
        if(Auth::guard('nhanvien')->logout()) {
            return redirect()->route('login');
        }
    }

    public function getIndex(){
        return view('index');
    }
}
