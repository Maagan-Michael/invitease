class DynamicObject(object):
    def __init__(self, props: dict) -> None:
        super().__init__()
        self.__dict__.update(props)


event_log_entry_info = DynamicObject(
    {
        "event_timestamp": {"export_title": "תאריך"},
        "event_type": {"export_title": "סוג"},
        "amount_before": {"export_title": "כמות אחרי"},
        "amount_after": {"export_title": "כמות לפני"},
        "user_id": {"export_title": "משתמש"},
        "guard_id": {"export_title": "שומר"},
        "invitation_id": {"export_title": "הזמנה"},
    }
)
