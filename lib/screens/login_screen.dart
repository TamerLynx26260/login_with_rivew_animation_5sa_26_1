import 'package:flutter/material.dart';
import 'package:rive/rive.dart';
import 'dart:async'; //3.1 Para usar Timer y simular un proceso de inicio de sesión

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  //control para mostrar u ocultar la contraseña
  bool _obscureText = true;
  
  //Crear el cerebrro de la animacion 
  StateMachineController? _controller;
  //SMI: State Machine Input
  SMIBool? _isChecking;
  SMIBool? _isHandsUp;
  SMITrigger? _trigSuccess;
  SMITrigger? _trigFail;
  
  //2.1 variable para el recorrido de la mirada
  SMINumber? _numLook;

//1.1)crear variables para focusnode
  final FocusNode _emailFocusNode = FocusNode();
  final FocusNode _passwordFocusNode = FocusNode();

  //timer para detener mirada al dejar de escribir
  Timer? _typingDebounce;

//1.2)Listeners para detectar cuando el usuario enfoca o desenfoca los campos de texto
  @override
  void initState() {
    super.initState();
    _emailFocusNode.addListener(() {
      if (_emailFocusNode.hasFocus) {
        if (_isHandsUp != null) {
        //No tapes los ojos al ver email
        _isHandsUp?.change(false);
        //2.2 Mirada neutral
        _numLook?.value = 50.0;
        }
      }
    });
    _passwordFocusNode.addListener(() {
      //manos arriba al enfocar el campo de contraseña
        _isHandsUp?.change(_passwordFocusNode.hasFocus);
        });
      }

  @override
  Widget build(BuildContext context) {
    //para obtener el tamaño de la pantalla y usarlo para ajustar el diseño
    final Size size = MediaQuery.of(context).size;
 
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            children: [
              SizedBox(
                width: size.width,
                height:250,
              child: RiveAnimation.asset('assets/animated_login_bear.riv', 
              stateMachines: ['Login Machine'],
              //Al iniciar la animacion
              onInit: (artboard) {
                _controller = StateMachineController.fromArtboard(artboard, 'Login Machine');
                //Verifica que inicio bien
                if(_controller == null) return;
                //Agrega el controlador al tablero/escenario
                artboard.addController(_controller!);
                //Vincular variables
                _isChecking = _controller!.findSMI('isChecking');
                _isHandsUp = _controller!.findSMI('isHandsUp');
                _trigSuccess = _controller!.findSMI('trigSuccess');
                _trigFail = _controller!.findSMI('trigFail');

                //2.3 vincular numlook
                _numLook = _controller!.findSMI('numLook');

              }
              
              )
              ),
              //Para separacion
              const SizedBox(height: 10),
              //Campo de texto para el email
              TextField(
                //1.3)Asignar los focusnode a los campos de texto
                focusNode: _emailFocusNode,
                onChanged: (value) {
                  if (_isHandsUp != null) {
                    //No tapes los ojos al ver email
                  // _isHandsUp!.change(false);
                  }
                  if (_isChecking == null) return;
                  //Activa  el modo chisme
                  _isChecking!.change(true);
                  //implementar numLook
                  //Ajustes de limites de 0 a 100
                  //80 como medida de calibracion
                  final look = (value.length/80.0*100)
                  .clamp(0.0, 100.0); //clamp es el rango (abrazadera)
                  _numLook?.value = look;

                  //3.3 Debounce: sivuelve a teclear reinicia el contador
                  //cancelar cualquier timer existente
                  _typingDebounce?.cancel();
                  //crear un nuevo timer
                  _typingDebounce = Timer(const Duration(seconds: 2), () {
                    //si se cierra la pantalla, quita el contador
                    if (!mounted) return;
                  //mirada neutra
                  _isChecking?.change(false);
                  });

                },
                //Para mostrar un tipo de tecleado
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  hintText: 'Email',
                  prefixIcon: Icon(Icons.email),
                  border: OutlineInputBorder(
                    //Para redondear los bordes del campo de texto
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              TextField(
                //1.3)Asignar los focusnode a los campos de texto
                focusNode: _passwordFocusNode,
                onChanged: (value) {
                  if (_isHandsUp != null) {
                    //No modo chisme
                    //_isChecking!.change(false);
                  }
                  if (_isHandsUp == null) return;
                  //Arriba las manos
                  _isHandsUp!.change(true);
                },

                obscureText: _obscureText,
                decoration: InputDecoration(
                  hintText: 'Password',
                  prefixIcon: const Icon(Icons.lock),//Cerrado o Seguro
                  suffixIcon: IconButton(
                    //if terniario
                    icon: Icon(
                      _obscureText ? Icons.visibility : Icons.visibility_off),
                    onPressed: () {
                      //Refresca el widget para mostrar u ocultar la contraseña
                      setState(() {
                        //Cambiar el estado de _obscureText para mostrar u ocultar la contraseña
                        _obscureText = !_obscureText;
                      });
                    },
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
  //Liberar recursos de los focusnode
  @override
  void dispose() {
    _emailFocusNode.dispose();
    _passwordFocusNode.dispose();
    super.dispose();
    _typingDebounce?.cancel(); //Cancelar el timer si existe
  }
}
