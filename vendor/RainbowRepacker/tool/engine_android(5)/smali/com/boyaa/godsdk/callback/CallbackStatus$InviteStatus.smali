.class public final Lcom/boyaa/godsdk/callback/CallbackStatus$InviteStatus;
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
    name = "InviteStatus"
.end annotation


# static fields
.field public static final INVITE_STATUS_START:I = 0x13880

.field public static final RESULT_CODE_UnknownError:I = 0x139ac

.field public static final RESULT_CODE_cancel:I = 0x138e4

.field public static final RESULT_CODE_fail:I = 0x13948

.field public static final RESULT_CODE_success:I = 0x13880


# instance fields
.field final synthetic this$0:Lcom/boyaa/godsdk/callback/CallbackStatus;


# direct methods
.method public constructor <init>(Lcom/boyaa/godsdk/callback/CallbackStatus;)V
    .locals 0

    .prologue
    .line 282
    iput-object p1, p0, Lcom/boyaa/godsdk/callback/CallbackStatus$InviteStatus;->this$0:Lcom/boyaa/godsdk/callback/CallbackStatus;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
