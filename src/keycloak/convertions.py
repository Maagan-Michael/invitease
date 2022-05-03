from database.models import User


def json_to_user(user_data: dict) -> User:
    result = User()
    result.user_id = user_data.get('id')
    result.first_name = user_data.get('firstName')
    result.last_name = user_data.get('lastName')
    result.creation_timestamp = user_data.get('createdTimestamp')
    result.email = user_data.get('email')
    result.is_active = user_data.get('enabled')
    attributes = user_data.get('attributes')
    if attributes is not None:
        result.cellular_number = next(
            iter(attributes.get('cellularNumber')), None)
    return result
