from django.contrib import admin
from django.contrib.auth.admin import UserAdmin as BaseUserAdmin
from django.contrib.auth.models import Group

from accounts.models import User


class UserAdmin(BaseUserAdmin):
    list_display = ('name', 'email', 'is_active', 'is_admin')
    list_filter = ('is_active', 'is_admin')
    ordering = ['created_at']
    search_fields = ('name', 'email')
    fieldsets = (
        (None, {'fields': ('name', 'email', 'friends')}),
        ('Permissions', {'fields': ('is_admin', 'is_active')}),
    )
    add_fieldsets = (
        (None, {
            'classes': 'wide',
            'fields': ('name', 'email', 'password1', 'password2', 'is_active', 'is_admin'),
        }),
    )


admin.site.register(User, UserAdmin)
admin.site.unregister(Group)
