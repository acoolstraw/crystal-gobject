module Gst
  class Buffer
    include GObject::WrappedType

    def self.new(mini_object : Gst::MiniObject|Nil = nil, pool : Gst::BufferPool|Nil = nil, pts : UInt64|Nil = nil, dts : UInt64|Nil = nil, duration : UInt64|Nil = nil, offset : UInt64|Nil = nil, offset_end : UInt64|Nil = nil) : self
      ptr = Pointer(UInt8).malloc(112, 0u8)
      new(ptr.as(LibGst::Buffer*)).tap do |object|
        object.mini_object = mini_object unless mini_object.nil?
        object.pool = pool unless pool.nil?
        object.pts = pts unless pts.nil?
        object.dts = dts unless dts.nil?
        object.duration = duration unless duration.nil?
        object.offset = offset unless offset.nil?
        object.offset_end = offset_end unless offset_end.nil?
      end
    end

    @pointer : Void*
    def initialize(pointer : LibGst::Buffer*)
      @pointer = pointer.as(Void*)
    end

    def to_unsafe
      @pointer.not_nil!.as(LibGst::Buffer*)
    end

    def self.new : self
      __return_value = LibGst.buffer_new
      cast Gst::Buffer.new(__return_value)
    end

    def self.new_allocate(allocator, size, params) : self
      __return_value = LibGst.buffer_new_allocate(allocator ? allocator.to_unsafe.as(LibGst::Allocator*) : nil, UInt64.new(size), params ? params.to_unsafe.as(LibGst::AllocationParams*) : nil)
      cast Gst::Buffer.new(__return_value) if __return_value
    end

    def self.new_wrapped(data, size) : self
      __return_value = LibGst.buffer_new_wrapped(data, UInt64.new(size))
      cast Gst::Buffer.new(__return_value)
    end

    def self.new_wrapped_bytes(bytes) : self
      __return_value = LibGst.buffer_new_wrapped_bytes(bytes.to_unsafe.as(LibGLib::Bytes*))
      cast Gst::Buffer.new(__return_value)
    end

    def self.new_wrapped_full(flags : Gst::MemoryFlags, data, maxsize, offset, size, user_data, notify) : self
      __return_value = LibGst.buffer_new_wrapped_full(flags, data, UInt64.new(maxsize), UInt64.new(offset), UInt64.new(size), user_data ? user_data : nil, notify ? notify : nil)
      cast Gst::Buffer.new(__return_value)
    end

    def add_meta(info, params)
      __return_value = LibGst.buffer_add_meta(@pointer.as(LibGst::Buffer*), info.to_unsafe.as(LibGst::MetaInfo*), params ? params : nil)
      Gst::Meta.new(__return_value) if __return_value
    end

    def add_parent_buffer_meta(ref)
      __return_value = LibGst.buffer_add_parent_buffer_meta(@pointer.as(LibGst::Buffer*), ref.to_unsafe.as(LibGst::Buffer*))
      Gst::ParentBufferMeta.new(__return_value) if __return_value
    end

    def add_protection_meta(info)
      __return_value = LibGst.buffer_add_protection_meta(@pointer.as(LibGst::Buffer*), info.to_unsafe.as(LibGst::Structure*))
      Gst::ProtectionMeta.new(__return_value)
    end

    def add_reference_timestamp_meta(reference, timestamp, duration)
      __return_value = LibGst.buffer_add_reference_timestamp_meta(@pointer.as(LibGst::Buffer*), reference.to_unsafe.as(LibGst::Caps*), UInt64.new(timestamp), UInt64.new(duration))
      Gst::ReferenceTimestampMeta.new(__return_value) if __return_value
    end

    def append(buf2)
      __return_value = LibGst.buffer_append(@pointer.as(LibGst::Buffer*), buf2.to_unsafe.as(LibGst::Buffer*))
      Gst::Buffer.new(__return_value)
    end

    def append_memory(mem)
      LibGst.buffer_append_memory(@pointer.as(LibGst::Buffer*), mem.to_unsafe.as(LibGst::Memory*))
      nil
    end

    def append_region(buf2, offset, size)
      __return_value = LibGst.buffer_append_region(@pointer.as(LibGst::Buffer*), buf2.to_unsafe.as(LibGst::Buffer*), Int64.new(offset), Int64.new(size))
      Gst::Buffer.new(__return_value)
    end

    def copy_deep
      __return_value = LibGst.buffer_copy_deep(@pointer.as(LibGst::Buffer*))
      Gst::Buffer.new(__return_value)
    end

    def copy_into(src, flags : Gst::BufferCopyFlags, offset, size)
      __return_value = LibGst.buffer_copy_into(@pointer.as(LibGst::Buffer*), src.to_unsafe.as(LibGst::Buffer*), flags, UInt64.new(offset), UInt64.new(size))
      __return_value
    end

    def copy_region(flags : Gst::BufferCopyFlags, offset, size)
      __return_value = LibGst.buffer_copy_region(@pointer.as(LibGst::Buffer*), flags, UInt64.new(offset), UInt64.new(size))
      Gst::Buffer.new(__return_value)
    end

    def extract(offset, dest, size)
      __return_value = LibGst.buffer_extract(@pointer.as(LibGst::Buffer*), UInt64.new(offset), dest, size)
      __return_value
    end

    def extract_dup(offset, size, dest, dest_size)
      LibGst.buffer_extract_dup(@pointer.as(LibGst::Buffer*), UInt64.new(offset), UInt64.new(size), dest, dest_size)
      nil
    end

    def fill(offset, src, size)
      __return_value = LibGst.buffer_fill(@pointer.as(LibGst::Buffer*), UInt64.new(offset), src, UInt64.new(size))
      __return_value
    end

    def find_memory(offset, size, idx, length, skip)
      __return_value = LibGst.buffer_find_memory(@pointer.as(LibGst::Buffer*), UInt64.new(offset), UInt64.new(size), idx, length, skip)
      __return_value
    end

    def foreach_meta(func, user_data)
      __return_value = LibGst.buffer_foreach_meta(@pointer.as(LibGst::Buffer*), func, user_data ? user_data : nil)
      __return_value
    end

    def all_memory
      __return_value = LibGst.buffer_get_all_memory(@pointer.as(LibGst::Buffer*))
      Gst::Memory.new(__return_value) if __return_value
    end

    def flags
      __return_value = LibGst.buffer_get_flags(@pointer.as(LibGst::Buffer*))
      __return_value
    end

    def memory(idx)
      __return_value = LibGst.buffer_get_memory(@pointer.as(LibGst::Buffer*), UInt32.new(idx))
      Gst::Memory.new(__return_value) if __return_value
    end

    def memory_range(idx, length)
      __return_value = LibGst.buffer_get_memory_range(@pointer.as(LibGst::Buffer*), UInt32.new(idx), Int32.new(length))
      Gst::Memory.new(__return_value) if __return_value
    end

    def meta(api)
      __return_value = LibGst.buffer_get_meta(@pointer.as(LibGst::Buffer*), UInt64.new(api))
      Gst::Meta.new(__return_value) if __return_value
    end

    def n_meta(api_type)
      __return_value = LibGst.buffer_get_n_meta(@pointer.as(LibGst::Buffer*), UInt64.new(api_type))
      __return_value
    end

    def reference_timestamp_meta(reference)
      __return_value = LibGst.buffer_get_reference_timestamp_meta(@pointer.as(LibGst::Buffer*), reference ? reference.to_unsafe.as(LibGst::Caps*) : nil)
      Gst::ReferenceTimestampMeta.new(__return_value) if __return_value
    end

    def size
      __return_value = LibGst.buffer_get_size(@pointer.as(LibGst::Buffer*))
      __return_value
    end

    def sizes(offset, maxsize)
      __return_value = LibGst.buffer_get_sizes(@pointer.as(LibGst::Buffer*), offset, maxsize)
      __return_value
    end

    def sizes_range(idx, length, offset, maxsize)
      __return_value = LibGst.buffer_get_sizes_range(@pointer.as(LibGst::Buffer*), UInt32.new(idx), Int32.new(length), offset, maxsize)
      __return_value
    end

    def has_flags(flags : Gst::BufferFlags)
      __return_value = LibGst.buffer_has_flags(@pointer.as(LibGst::Buffer*), flags)
      __return_value
    end

    def insert_memory(idx, mem)
      LibGst.buffer_insert_memory(@pointer.as(LibGst::Buffer*), Int32.new(idx), mem.to_unsafe.as(LibGst::Memory*))
      nil
    end

    def all_memory_writable?
      __return_value = LibGst.buffer_is_all_memory_writable(@pointer.as(LibGst::Buffer*))
      __return_value
    end

    def memory_range_writable?(idx, length)
      __return_value = LibGst.buffer_is_memory_range_writable(@pointer.as(LibGst::Buffer*), UInt32.new(idx), Int32.new(length))
      __return_value
    end

    def map(info, flags : Gst::MapFlags)
      __return_value = LibGst.buffer_map(@pointer.as(LibGst::Buffer*), info, flags)
      __return_value
    end

    def map_range(idx, length, info, flags : Gst::MapFlags)
      __return_value = LibGst.buffer_map_range(@pointer.as(LibGst::Buffer*), UInt32.new(idx), Int32.new(length), info, flags)
      __return_value
    end

    def memcmp(offset, mem, size)
      __return_value = LibGst.buffer_memcmp(@pointer.as(LibGst::Buffer*), UInt64.new(offset), mem, UInt64.new(size))
      __return_value
    end

    def memset(offset, val, size)
      __return_value = LibGst.buffer_memset(@pointer.as(LibGst::Buffer*), UInt64.new(offset), UInt8.new(val), UInt64.new(size))
      __return_value
    end

    def n_memory
      __return_value = LibGst.buffer_n_memory(@pointer.as(LibGst::Buffer*))
      __return_value
    end

    def peek_memory(idx)
      __return_value = LibGst.buffer_peek_memory(@pointer.as(LibGst::Buffer*), UInt32.new(idx))
      Gst::Memory.new(__return_value) if __return_value
    end

    def prepend_memory(mem)
      LibGst.buffer_prepend_memory(@pointer.as(LibGst::Buffer*), mem.to_unsafe.as(LibGst::Memory*))
      nil
    end

    def remove_all_memory
      LibGst.buffer_remove_all_memory(@pointer.as(LibGst::Buffer*))
      nil
    end

    def remove_memory(idx)
      LibGst.buffer_remove_memory(@pointer.as(LibGst::Buffer*), UInt32.new(idx))
      nil
    end

    def remove_memory_range(idx, length)
      LibGst.buffer_remove_memory_range(@pointer.as(LibGst::Buffer*), UInt32.new(idx), Int32.new(length))
      nil
    end

    def remove_meta(meta)
      __return_value = LibGst.buffer_remove_meta(@pointer.as(LibGst::Buffer*), meta.to_unsafe.as(LibGst::Meta*))
      __return_value
    end

    def replace_all_memory(mem)
      LibGst.buffer_replace_all_memory(@pointer.as(LibGst::Buffer*), mem.to_unsafe.as(LibGst::Memory*))
      nil
    end

    def replace_memory(idx, mem)
      LibGst.buffer_replace_memory(@pointer.as(LibGst::Buffer*), UInt32.new(idx), mem.to_unsafe.as(LibGst::Memory*))
      nil
    end

    def replace_memory_range(idx, length, mem)
      LibGst.buffer_replace_memory_range(@pointer.as(LibGst::Buffer*), UInt32.new(idx), Int32.new(length), mem.to_unsafe.as(LibGst::Memory*))
      nil
    end

    def resize(offset, size)
      LibGst.buffer_resize(@pointer.as(LibGst::Buffer*), Int64.new(offset), Int64.new(size))
      nil
    end

    def resize_range(idx, length, offset, size)
      __return_value = LibGst.buffer_resize_range(@pointer.as(LibGst::Buffer*), UInt32.new(idx), Int32.new(length), Int64.new(offset), Int64.new(size))
      __return_value
    end

    def flags=(flags : Gst::BufferFlags)
      __return_value = LibGst.buffer_set_flags(@pointer.as(LibGst::Buffer*), flags)
      __return_value
    end

    def size=(size)
      LibGst.buffer_set_size(@pointer.as(LibGst::Buffer*), Int64.new(size))
      nil
    end

    def unmap(info)
      LibGst.buffer_unmap(@pointer.as(LibGst::Buffer*), info.to_unsafe.as(LibGst::MapInfo*))
      nil
    end

    def unset_flags(flags : Gst::BufferFlags)
      __return_value = LibGst.buffer_unset_flags(@pointer.as(LibGst::Buffer*), flags)
      __return_value
    end

    def self.max_memory
      __return_value = LibGst.buffer_get_max_memory
      __return_value
    end

    def mini_object
      Gst::MiniObject.new((to_unsafe.as(LibGst::Buffer*).value.mini_object))
    end

    def mini_object=(value : Gst::MiniObject)
      to_unsafe.as(LibGst::Buffer*).value.mini_object = value
    end

    def pool
      Gst::BufferPool.new((to_unsafe.as(LibGst::Buffer*).value.pool))
    end

    def pool=(value : Gst::BufferPool)
      to_unsafe.as(LibGst::Buffer*).value.pool = value.to_unsafe.as(LibGst::BufferPool*)
    end

    def pts
      (to_unsafe.as(LibGst::Buffer*).value.pts)
    end

    def pts=(value : UInt64)
      to_unsafe.as(LibGst::Buffer*).value.pts = UInt64.new(value)
    end

    def dts
      (to_unsafe.as(LibGst::Buffer*).value.dts)
    end

    def dts=(value : UInt64)
      to_unsafe.as(LibGst::Buffer*).value.dts = UInt64.new(value)
    end

    def duration
      (to_unsafe.as(LibGst::Buffer*).value.duration)
    end

    def duration=(value : UInt64)
      to_unsafe.as(LibGst::Buffer*).value.duration = UInt64.new(value)
    end

    def offset
      (to_unsafe.as(LibGst::Buffer*).value.offset)
    end

    def offset=(value : UInt64)
      to_unsafe.as(LibGst::Buffer*).value.offset = UInt64.new(value)
    end

    def offset_end
      (to_unsafe.as(LibGst::Buffer*).value.offset_end)
    end

    def offset_end=(value : UInt64)
      to_unsafe.as(LibGst::Buffer*).value.offset_end = UInt64.new(value)
    end

  end
end

