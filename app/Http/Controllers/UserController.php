<?php

namespace App\Http\Controllers;

use App\Models\User;
use App\Models\Role;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use Illuminate\Validation\Rules\Password;

class UserController extends Controller
{
    public function index()
    {
        $users = User::with('role')->get();
        $roles = Role::all();
        return view('config.usuarios', compact('users', 'roles'));
    }

    public function store(Request $request)
    {
        $data = $request->validate([
            'name' => 'required|string|max:255',
            'email' => 'required|string|email|max:255|unique:users',
            'password' => ['required', Password::defaults()],
            'role_id' => 'required|exists:roles,id'
        ]);

        User::create([
            'name' => $data['name'],
            'email' => $data['email'],
            'password' => Hash::make($data['password']),
            'role_id' => $data['role_id'],
        ]);

        return back()->with('success', 'Usuario creado exitosamente.');
    }

    public function update(Request $request, User $usuario)
    {
        $data = $request->validate([
            'name' => 'required|string|max:255',
            'email' => 'required|string|email|max:255|unique:users,email,'.$usuario->id,
            'role_id' => 'required|exists:roles,id'
        ]);

        $usuario->update([
            'name' => $data['name'],
            'email' => $data['email'],
            'role_id' => $data['role_id'],
        ]);

        if ($request->filled('password')) {
            $request->validate(['password' => ['required', Password::defaults()]]);
            $usuario->update(['password' => Hash::make($request->password)]);
        }

        return back()->with('success', 'Usuario actualizado correctamente.');
    }

    public function destroy(User $usuario)
    {
        if (auth()->id() === $usuario->id) {
            return back()->with('error', 'No puedes eliminar tu propia cuenta.');
        }
        
        $usuario->delete();
        return back()->with('success', 'Usuario eliminado exitosamente.');
    }
}
