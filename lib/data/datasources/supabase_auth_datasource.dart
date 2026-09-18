import 'package:google_sign_in/google_sign_in.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseAuthDatasource {
  final SupabaseClient _supabaseClient;
  final GoogleSignIn _googleSignIn;

  SupabaseAuthDatasource({
    required SupabaseClient supabaseClient,
    required GoogleSignIn googleSignIn,
  })  : _supabaseClient = supabaseClient,
        _googleSignIn = googleSignIn;

  /// Initiates the Google Sign In flow and authenticates with Supabase using the idToken.
  Future<AuthResponse> signInWithGoogle() async {
    // Web clientId would be needed for web, serverClientId for Android/iOS idToken
    // Assuming serverClientId is passed into GoogleSignIn initialization.
    final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
    
    if (googleUser == null) {
      throw Exception('Google Sign In was aborted by the user.');
    }

    final GoogleSignInAuthentication googleAuth = await googleUser.authentication;
    final String? idToken = googleAuth.idToken;
    final String? accessToken = googleAuth.accessToken;

    if (idToken == null) {
      throw Exception('Could not retrieve idToken from Google Sign In.');
    }

    return _supabaseClient.auth.signInWithIdToken(
      provider: OAuthProvider.google,
      idToken: idToken,
      accessToken: accessToken,
    );
  }

  /// Signs out from both Supabase and Google.
  Future<void> signOut() async {
    await _googleSignIn.signOut();
    await _supabaseClient.auth.signOut();
  }

  /// Returns a stream of authentication state changes.
  Stream<AuthState> get authStateChanges => _supabaseClient.auth.onAuthStateChange;

  /// Returns the currently signed-in user, or null if none.
  User? get currentUser => _supabaseClient.auth.currentUser;
}
