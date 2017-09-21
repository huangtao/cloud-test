.class public final Lcom/boyaa/godsdk/callback/CallbackStatus$AccountStatus;
.super Ljava/lang/Object;
.source "CallbackStatus.java"

# interfaces
.implements Lcom/boyaa/godsdk/callback/CallbackStatus$BaseCallbackStatus;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/boyaa/godsdk/callback/CallbackStatus;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x11
    name = "AccountStatus"
.end annotation


# static fields
.field public static final ACCOUNT_STATUS_START:I = 0x2710

.field public static final ALREADY_LOGINED:I = 0x2711

.field public static final LOGIN_CANCELED:I = 0x2775

.field public static final LOGIN_FAILED:I = 0x2774

.field public static final LOGIN_SUCCESS:I = 0x2710

.field public static final LOGIN_TIMEOUT:I = 0x2776

.field public static final LOGOUT_FAILED:I = 0x283c

.field public static final LOGOUT_NOT_SUPPORT:I = 0x283d

.field public static final LOGOUT_SUCCESS:I = 0x27d8

.field public static final SDK_LOGOUT:I = 0x2968

.field public static final SDK_LOGOUT_FAILED:I = 0x2a30

.field public static final SDK_LOGOUT_SUCCESS:I = 0x29cc

.field public static final SDK_SWITCH_ACCOUNT:I = 0x2a94

.field public static final SDK_SWITCH_ACCOUNT_FAILED:I = 0x2b5c

.field public static final SDK_SWITCH_ACCOUNT_SUCCESS:I = 0x2af8

.field public static final SWITCH_ACCOUNT_CANCELED:I = 0x2905

.field public static final SWITCH_ACCOUNT_FAILED:I = 0x2904

.field public static final SWITCH_ACCOUNT_NOT_SUPPORT:I = 0x2907

.field public static final SWITCH_ACCOUNT_SUCCESS:I = 0x28a0

.field public static final SWITCH_ACCOUNT_TIMEOUT:I = 0x2906


# instance fields
.field final synthetic this$0:Lcom/boyaa/godsdk/callback/CallbackStatus;


# direct methods
.method public constructor <init>(Lcom/boyaa/godsdk/callback/CallbackStatus;)V
    .locals 0

    .prologue
    .line 55
    iput-object p1, p0, Lcom/boyaa/godsdk/callback/CallbackStatus$AccountStatus;->this$0:Lcom/boyaa/godsdk/callback/CallbackStatus;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
