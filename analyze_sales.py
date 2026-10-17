"""Sales analysis using pandas. Uses synthetic practice data."""
from pathlib import Path
import pandas as pd

DATA_PATH = Path(__file__).parent / "data" / "sales_data.csv"
df = pd.read_csv(DATA_PATH, parse_dates=["order_date"])

assert df["order_id"].is_unique, "Order IDs should be unique."
assert df[["revenue", "profit"]].notna().all().all(), "Revenue/profit contain missing values."

df["month"] = df["order_date"].dt.to_period("M").astype(str)

total_revenue = df["revenue"].sum()
total_profit = df["profit"].sum()
orders = df["order_id"].nunique()

print("SALES KPI SUMMARY")
print(f"Orders: {orders:,}")
print(f"Revenue: {total_revenue:,.2f}")
print(f"Estimated profit: {total_profit:,.2f}")
print(f"Average revenue per order: {total_revenue / orders:,.2f}")
print(f"Profit margin: {total_profit / total_revenue:.2%}")

print("\nRevenue by category")
print(df.groupby("category")[["revenue", "profit"]].sum().sort_values("revenue", ascending=False))

print("\nRevenue by region")
print(df.groupby("region")[["revenue", "profit"]].sum().sort_values("revenue", ascending=False))

out = Path(__file__).parent / "outputs"
out.mkdir(exist_ok=True)
df.groupby("month", as_index=False).agg(
    revenue=("revenue", "sum"),
    profit=("profit", "sum"),
    orders=("order_id", "nunique"),
).to_csv(out / "monthly_summary.csv", index=False)
print(f"\nMonthly summary saved to {out / 'monthly_summary.csv'}")
