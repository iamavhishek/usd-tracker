/// Shared view status for data screens. Data is retained across `refreshing`
/// so a refresh never blanks the content.
enum ViewStatus { initial, loading, refreshing, success, failure }
