class DynamicObject(object):
    def __init__(self, props: dict) -> None:
        super().__init__()
        self.__dict__.update(props)


event_log_entry_info = DynamicObject(
    {
        "event_timestamp": {"export_title": "Date"},
        "event_type": {"export_title": "Type"},
        "amount_before": {"export_title": "Amount After"},
        "amount_after": {"export_title": "Amount Before"},
        "user_id": {"export_title": "User"},
        "guard_id": {"export_title": "Guard"},
        "invitation_id": {"export_title": "Invitation"},
    }
)
