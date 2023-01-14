import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:piton_assignment/features/auth/domain/models/user.dart';

part 'user_dto.freezed.dart';

@freezed
class UserDto with _$UserDto {
  const factory UserDto({
    required String token,
    required int id,
  }) = _UserDto;

  const UserDto._();

  factory UserDto.fromToken(String token) {
    return UserDto(
      token: token,
      id: int.parse(
        (JwtDecoder.decode(token)["https://hasura.io/jwt/claims"] as Map<String, dynamic>)["x-hasura-user-id"]
            as String,
      ),
    );
  }

  User toDomain() {
    return User(token: token, id: id);
  }
}
