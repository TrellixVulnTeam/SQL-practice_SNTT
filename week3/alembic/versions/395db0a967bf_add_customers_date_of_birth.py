"""add customers date_of_birth

Revision ID: 395db0a967bf
Revises: b4d6fd233890
Create Date: 2022-04-07 22:09:11.353168

"""
from alembic import op
import sqlalchemy as sa


# revision identifiers, used by Alembic.
revision = '395db0a967bf'
down_revision = 'b4d6fd233890'
branch_labels = None
depends_on = None


def upgrade():
    op.execute(
        """
        ALTER TABLE customers
        ADD COLUMN date_of_birth TIMESTAMP;
        """
    )


def downgrade():
    op.execute(
        """
        ALTER TABLE customers
        DROP COLUMN date_of_birth;
        """
    )
