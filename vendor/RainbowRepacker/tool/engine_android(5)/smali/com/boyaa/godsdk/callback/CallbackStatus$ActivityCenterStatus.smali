.class public final Lcom/boyaa/godsdk/callback/CallbackStatus$ActivityCenterStatus;
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
    name = "ActivityCenterStatus"
.end annotation


# static fields
.field public static final ACTIVITY_CENTER_STATUS_START:I = 0xea60

.field public static final RESULT_CODE_UnknownError:I = 0xec54

.field public static final RESULT_CODE_display:I = 0xeac4

.field public static final RESULT_CODE_fail:I = 0xebf0

.field public static final RESULT_CODE_force_push:I = 0xeb8c

.field public static final RESULT_CODE_getNum:I = 0xea60

.field public static final RESULT_CODE_switch_server:I = 0xeb28


# instance fields
.field final synthetic this$0:Lcom/boyaa/godsdk/callback/CallbackStatus;


# direct methods
.method public constructor <init>(Lcom/boyaa/godsdk/callback/CallbackStatus;)V
    .locals 0

    .prologue
    .line 232
    iput-object p1, p0, Lcom/boyaa/godsdk/callback/CallbackStatus$ActivityCenterStatus;->this$0:Lcom/boyaa/godsdk/callback/CallbackStatus;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
